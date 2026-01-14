from models import WorldState, Goal, Action
from planner import Planner

class AdvancedAgent:
    def __init__(self):
        self.state = WorldState(True, 30, False)

        self.goals = [
            # Eating is valuable ONLY when hungry AND food exists
            Goal(
                "eat",
                lambda s: 300 if (s.hungry and s.has_food) else 0
            ),

            # Resting is BAD when hungry
            Goal(
                "rest",
                lambda s: max(0, 50 - s.energy) - (200 if s.hungry else 0)
            )
        ]

        self.actions = [
            Action("search_food", 5,
                   lambda s: not s.has_food,
                   lambda s: setattr(s, "has_food", True)),

            Action("eat", 2,
                   lambda s: s.has_food and s.hungry,
                   self._eat_effect),

            Action("rest", 1,
                   lambda s: s.energy < 80,
                   lambda s: setattr(s, "energy", s.energy + 10))
        ]

        self.planner = Planner()
        self.memory = []

    def _eat_effect(self, s):
        s.hungry = False
        s.energy += 20
        s.has_food = False

    def step(self):
        action = self.planner.choose_action(self.state, self.goals, self.actions)
        if action:
            print("→ Action:", action.name)
            action.effect(self.state)
            self.memory.append(action.name)
