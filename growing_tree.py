import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

# Set up figure and axes
fig, ax = plt.subplots(figsize=(6, 8))
ax.set_facecolor("black")
ax.set_xticks([])
ax.set_yticks([])
ax.set_xlim(-50, 50)
ax.set_ylim(0, 100)

# List to store branches 
branches = []

# Recursive function to generate tree structure
def generate_tree(x, y, angle, length, depth):
    if depth == 0:  # Base case: stop recursion when depth reaches zero
        return

    # Calculate new branch endpoint
    x_new = x + length * np.cos(np.radians(angle))
    y_new = y + length * np.sin(np.radians(angle))

    # Store the branch coordinates
    branches.append([[x, x_new], [y, y_new]])

    # Generate left and right child branches with random angles and lengths
    generate_tree(x_new, y_new, angle - np.random.uniform(15, 25), length * np.random.uniform(0.7, 0.85), depth - 1)
    generate_tree(x_new, y_new, angle + np.random.uniform(15, 25), length * np.random.uniform(0.7, 0.85), depth - 1)

# Generate the tree structure
generate_tree(0, 0, 90, 20, 8)  # Start from (0,0), going upward (90 degrees), initial length 20, depth 8

# Function to update the animation frame by frame
def update(frame):
    ax.clear()  # Clear the previous frame
    ax.set_facecolor("black")  # Set background color black
    ax.set_xticks([])  # Remove x-axis ticks
    ax.set_yticks([])  # Remove y-axis ticks
    ax.set_xlim(-50, 50)  # Keep x-axis limits fixed
    ax.set_ylim(0, 100)  # Keep y-axis limits fixed

    # Draw only the branches up to the current frame
    for i in range(min(frame, len(branches))):
        x, y = branches[i]  # Get branch coordinates
        ax.plot(x, y, color=plt.cm.plasma(i / len(branches)), lw=2)  # Draw branches with gradient color

# Create animation with increased speed
ani = animation.FuncAnimation(fig, update, frames=len(branches), interval=10, blit=False)

# Display animation in Jupyter Notebook
from IPython.display import HTML
HTML(ani.to_jshtml())
