import matplotlib.pyplot as plt
import numpy as np
import random

# --- SYSTEM CONFIGURATION ---
plt.style.use('dark_background')
fig, ax = plt.subplots(figsize=(10, 8))
ax.set_aspect('equal')
ax.axis('off')

# Professional color palette (Natural Gradients)
BARK_COLORS = ["#3E2723", "#4E342E", "#5D4037"]
LEAF_COLORS = ["#2E7D32", "#388E3C", "#4CAF50", "#81C784"]


def advance_tree(x, y, angle, depth, length, width):
    if depth == 0:
        # --- LEAF GENERATION PHASE ---
        # Add high-fidelity leaves at the tips
        for _ in range(3):
            leaf_x = x + random.uniform(-0.02, 0.02)
            leaf_y = y + random.uniform(-0.02, 0.02)
            ax.scatter(leaf_x, leaf_y, s=random.randint(10, 40),
                       color=random.choice(LEAF_COLORS), alpha=0.6, edgecolors='none')
        return

    # --- BIOLOGICAL VARIATION (Stochastic Growth) ---
    # Real trees aren't perfect; we add "noise" to the length and angle
    variation_len = length * random.uniform(0.7, 0.9)
    variation_angle = random.uniform(0.15, 0.45)  # Random branch spread

    # Calculate end coordinates with a slight "wind" curve
    x2 = x + variation_len * np.cos(angle + random.uniform(-0.05, 0.05))
    y2 = y + variation_len * np.sin(angle + random.uniform(-0.05, 0.05))

    # --- PROCEDURAL TEXTURING ---
    # Tapering effect: Branches get thinner as they grow higher
    color = random.choice(BARK_COLORS) if depth > 4 else "#2D5A27"
    ax.plot([x, x2], [y, y2], color=color, linewidth=width, solid_capstyle='round', alpha=0.9)

    # Optional: Faster rendering by reducing pause as it goes deeper
    if depth > 5:
        plt.pause(0.001)

    # --- RECURSIVE BRANCHING ---
    # Create 2 to 3 branches instead of just 2 for realism
    num_branches = random.choice([2, 2, 3])
    for i in range(num_branches):
        # Calculate a unique angle for each sub-branch
        new_angle = angle + (variation_angle if i == 0 else -variation_angle if i == 1 else 0)
        advance_tree(x2, y2, new_angle, depth - 1, variation_len, width * 0.75)


# --- BOOT SEQUENCE ---
print("⚙️ INITIALIZING BOREAL ENGINE...")
ax.set_xlim(-1.2, 1.2)
ax.set_ylim(0, 1.8)

# Root coordinates (0,0), Start Angle (90 deg), Depth (11), Base Length, Base Width
advance_tree(0, 0, np.pi / 2, 11, 0.45, 8)

plt.title("🌲 ADVANCED BIOLOGICAL FRACTAL", color='#81C784', fontname='monospace', size=14)
plt.show()
