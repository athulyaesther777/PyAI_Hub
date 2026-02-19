import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# Create figure
fig, ax = plt.subplots(figsize=(6, 6))
fig.patch.set_facecolor("black")
ax.set_facecolor("black")
ax.set_xlim(-2, 2)
ax.set_ylim(-2, 2)
ax.axis("off")

# Parameters
lines = []
num_lines = 80

for i in range(num_lines):
    line, = ax.plot([], [], lw=1)
    lines.append(line)

def update(frame):
    theta = np.linspace(0, 2*np.pi, 400)
    
    for i, line in enumerate(lines):
        r = 0.5 + 0.8 * np.sin(theta * (i/10 + 1) + frame * 0.1)
        x = r * np.cos(theta)
        y = r * np.sin(theta)
        
        color = plt.cm.plasma(i / num_lines)
        line.set_data(x, y)
        line.set_color(color)
    
    return lines

ani = FuncAnimation(fig, update, frames=200, interval=50)

plt.show()
