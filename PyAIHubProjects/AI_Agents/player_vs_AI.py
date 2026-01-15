import random
from dataclasses import dataclass
from typing import Callable
import copy


# ---------- MODELS ----------

@dataclass
class Entity:
    x: int
    y: int
    hunger: int
    energy: int
    has_food: bool = False


@dataclass
class Goal:
    name: str
    utility_fn: Callable

    def utility(self, state):
        return self.utility_fn(state)


@dataclass
class Action:
    name: str
    cost: int
    precondition: Callable
    effect: Callable

    def applicable(self, state):
        return self.precondition(state)


# ---------- PLANNER ----------

class Planner:
    def choose_action(self, state, goals, actions):
        best_action = None
        best_score = float("-inf")

        for action in actions:
            if not action.applicable(state):
                continue

            simulated = copy.deepcopy(state)
            action.effect(simulated)

            score = sum(g.utility(simulated) for g in goals) - action.cost
            if score > best_score:
                best_score = score
                best_action = action

        return best_action


# ---------- AI AGENT ----------

class AIPlayer:
    def __init__(self):
        self.state = Entity(4, 4, hunger=40, energy=60)

        self.goals = [
            Goal("reduce_hunger", lambda s: s.hunger * 3),
            Goal("restore_energy", lambda s: max(0, 70 - s.energy)),
        ]

        self.actions = [
            Action("move", 5, lambda s: True, self.move),
            Action("eat", 2, lambda s: s.has_food, self.eat),
        ]

        self.planner = Planner()

    def move(self, s):
        s.x = max(0, min(4, s.x + random.choice([-1, 0, 1])))
        s.y = max(0, min(4, s.y + random.choice([-1, 0, 1])))

    def eat(self, s):
        s.hunger = max(0, s.hunger - 30)
        s.energy = min(100, s.energy + 20)
        s.has_food = False

    def decay(self):
        self.state.hunger += 5
        self.state.energy -= 3

    def step(self):
        action = self.planner.choose_action(self.state, self.goals, self.actions)
        if action:
            action.effect(self.state)
        self.decay()


# ---------- GAME ----------

def draw_map(player, ai, food):
    for y in range(5):
        for x in range(5):
            if (x, y) == (player.x, player.y):
                print("P", end=" ")
            elif (x, y) == (ai.state.x, ai.state.y):
                print("A", end=" ")
            elif (x, y) == food:
                print("F", end=" ")
            else:
                print(".", end=" ")
        print()


def run_game():
    player = Entity(0, 0, hunger=40, energy=60)
    ai = AIPlayer()
    food = (random.randint(0, 4), random.randint(0, 4))

    print("\n🎮 PLAYER vs AI SURVIVAL GAME")
    print("Controls: W A S D\n")

    for turn in range(1, 16):
        print(f"\n--- TURN {turn} ---")
        draw_map(player, ai, food)

        print(f"Player → Hunger:{player.hunger} Energy:{player.energy}")
        print(f"AI     → Hunger:{ai.state.hunger} Energy:{ai.state.energy}")

        if player.energy <= 0 or player.hunger >= 100:
            print("\n💀 PLAYER LOST")
            return

        if ai.state.energy <= 0 or ai.state.hunger >= 100:
            print("\n🏆 PLAYER WINS! AI DIED")
            return

        move = input("Move (W/A/S/D): ").lower()
        if move == "w": player.y = max(0, player.y - 1)
        if move == "s": player.y = min(4, player.y + 1)
        if move == "a": player.x = max(0, player.x - 1)
        if move == "d": player.x = min(4, player.x + 1)

        if (player.x, player.y) == food:
            player.hunger = max(0, player.hunger - 30)
            player.energy += 20
            food = (random.randint(0, 4), random.randint(0, 4))

        ai.step()

        if (ai.state.x, ai.state.y) == food:
            ai.state.has_food = True
            food = (random.randint(0, 4), random.randint(0, 4))

        player.hunger += 5
        player.energy -= 3

    print("\n🤝 DRAW — BOTH SURVIVED")


if __name__ == "__main__":
    run_game()
