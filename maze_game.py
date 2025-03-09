import pygame
import numpy as np
import random
import time

# Pygame initialization
pygame.init()

# Increased Screen settings
WIDTH, HEIGHT = 800, 800  # Larger window size
ROWS, COLS = 21, 21  # Ensure an odd number for better maze structure
CELL_SIZE = WIDTH // ROWS
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("AI Maze Solver - Solvable Maze")

# Colors
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
GREEN = (0, 255, 0)  # Goal
BLUE = (0, 0, 255)  # AI Player
RED = (255, 0, 0)  # Walls

# Directions (Up, Down, Left, Right)
DIRECTIONS = [(-2, 0), (2, 0), (0, -2), (0, 2)]


def generate_solvable_maze():
    """Generates a perfect maze using DFS and guarantees a path from start to goal."""
    maze = [[1] * COLS for _ in range(ROWS)]  # Start with walls
    stack = [(0, 0)]  # Start at top-left corner
    maze[0][0] = 0  # Open start position

    def is_valid(nx, ny):
        """Check if the next cell is within bounds and still a wall."""
        return 0 <= nx < ROWS and 0 <= ny < COLS and maze[nx][ny] == 1

    while stack:
        x, y = stack[-1]  # Current position
        random.shuffle(DIRECTIONS)  # Shuffle to create randomness
        for dx, dy in DIRECTIONS:
            nx, ny = x + dx, y + dy  # New position
            if is_valid(nx, ny):  # If valid move
                mx, my = x + dx // 2, y + dy // 2  # Middle cell to remove the wall
                maze[mx][my] = 0  # Remove wall
                maze[nx][ny] = 0  # Make next cell a path
                stack.append((nx, ny))  # Move forward
                break
        else:
            stack.pop()  # Backtrack if no moves left

    # **Ensure a direct path to goal**
    path_x, path_y = 0, 0
    while path_x < ROWS - 1 or path_y < COLS - 1:
        if path_x < ROWS - 1:
            path_x += 1
        if path_y < COLS - 1:
            path_y += 1
        maze[path_x][path_y] = 0  # Open path

    maze[ROWS - 1][COLS - 1] = 0  # Ensure the goal is reachable
    return maze


# AI Agent
class AI_Agent:
    def __init__(self, maze):
        self.q_table = np.zeros((ROWS, COLS, 4))  # Q-table for reinforcement learning
        self.alpha = 0.1  # Learning rate
        self.gamma = 0.9  # Discount factor
        self.epsilon = 0.2  # Exploration rate
        self.maze = maze
        self.position = (0, 0)  # Start position
        self.goal = (ROWS - 1, COLS - 1)

    def choose_action(self):
        if random.uniform(0, 1) < self.epsilon:  # Explore
            return random.choice([0, 1, 2, 3])  # Random action
        else:  # Exploit best known move
            return np.argmax(self.q_table[self.position[0], self.position[1]])

    def move(self, action):
        x, y = self.position
        dx, dy = DIRECTIONS[action]
        new_x, new_y = x + dx // 2, y + dy // 2  # Move 1 step at a time

        if 0 <= new_x < ROWS and 0 <= new_y < COLS and self.maze[new_x][new_y] == 0:
            self.position = (new_x, new_y)

    def learn(self, old_pos, action, reward, new_pos):
        old_q = self.q_table[old_pos[0], old_pos[1], action]
        max_future_q = np.max(self.q_table[new_pos[0], new_pos[1]])
        new_q = old_q + self.alpha * (reward + self.gamma * max_future_q - old_q)
        self.q_table[old_pos[0], old_pos[1], action] = new_q

    def update(self):
        old_pos = self.position
        action = self.choose_action()
        self.move(action)
        reward = 1 if self.position == self.goal else -0.1
        self.learn(old_pos, action, reward, self.position)


# Generate maze and create AI agent
maze = generate_solvable_maze()
ai_agent = AI_Agent(maze)

# Game loop
running = True
clock = pygame.time.Clock()

while running:
    screen.fill(WHITE)

    # Draw the maze
    for row in range(ROWS):
        for col in range(COLS):
            color = BLACK if maze[row][col] == 1 else WHITE
            pygame.draw.rect(screen, color, (col * CELL_SIZE, row * CELL_SIZE, CELL_SIZE, CELL_SIZE))

    # Draw AI player
    pygame.draw.circle(screen, BLUE, (ai_agent.position[1] * CELL_SIZE + CELL_SIZE // 2, ai_agent.position[0] * CELL_SIZE + CELL_SIZE // 2), CELL_SIZE // 4)

    # Draw the goal
    pygame.draw.rect(screen, GREEN, ((COLS - 1) * CELL_SIZE, (ROWS - 1) * CELL_SIZE, CELL_SIZE, CELL_SIZE))

    pygame.display.flip()

    ai_agent.update()  # AI learns and moves

    time.sleep(0.1)  # Slow down AI for visibility
    clock.tick(10)

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

pygame.quit()

