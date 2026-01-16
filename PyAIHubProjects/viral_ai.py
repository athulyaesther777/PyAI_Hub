import random
import time

class ViralAI:
    def __init__(self):
        self.energy = 70
        self.hunger = 40
        self.turn = 0

    def think(self):
        if self.energy > 75 and self.hunger < 60:
            return "rest"
        elif self.hunger > 65 and random.random() < 0.4:
            return "ignore_food"
        elif self.hunger > 70:
            return "eat"
        else:
            return random.choice(["explore", "rest"])

    def act(self, action):
        if action == "rest":
            self.energy += 10
            self.hunger += 10
            print("AI says: \"I should rest.\"")

        elif action == "eat":
            self.hunger -= 35
            self.energy += 5
            print("AI says: \"I need food now.\"")

        elif action == "explore":
            self.energy -= 10
            self.hunger += 5
            print("AI says: \"I will explore.\"")

        elif action == "ignore_food":
            self.energy += 5
            self.hunger += 15
            print("AI says: \"Eating is risky. I’ll wait.\"")

        self.energy = max(0, min(100, self.energy))
        self.hunger = max(0, min(100, self.hunger))

    def status(self):
        print(f"Energy: {self.energy} | Hunger: {self.hunger}")

    def run(self):
        print("\n🤖 AI SURVIVAL EXPERIMENT STARTED\n")
        while self.energy > 0 and self.hunger < 100:
            self.turn += 1
            print(f"\nTURN {self.turn}")
            action = self.think()
            self.act(action)
            self.status()

            if self.hunger > 65:
                print("⚠️ AI IS STARVING")

            time.sleep(1)

        print("\n🤯 AI SURVIVED BY EXPLOITING THE RULES\n")


if __name__ == "__main__":
    ViralAI().run()














