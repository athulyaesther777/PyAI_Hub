import copy

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
