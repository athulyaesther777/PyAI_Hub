from dataclasses import dataclass
from typing import Callable

@dataclass
class WorldState:
    hungry: bool
    energy: int
    has_food: bool

@dataclass
class Goal:
    name: str
    utility_fn: Callable

    def utility(self, state):
        return self.utility_fn(state)

@dataclass
class Action:
    name: str
    cost: float
    precondition: Callable
    effect: Callable

    def applicable(self, state):
        return self.precondition(state)
