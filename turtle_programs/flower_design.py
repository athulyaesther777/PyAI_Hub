# --- Animated Rainbow Mesh Flower (Turtle) ---
import turtle as t
import colorsys

#______________set up__________________
t.setup(width=900, height=900)   # window size
t.bgcolor("black")               # black background
t.speed(0)                       # fastest drawing
t.hideturtle()                   # hide the arrow
t.colormode(1.0)                 # turtle expects RGB floats 0..1
t.width(1)                       # thin mesh lines
t.tracer(10, 0)                  # <--- makes drawing ~10x faster

#-------------parameters-------------------
PETALS = 24                # number of petals around the circle
MESH_LINES = 28            # nested outlines inside each petal (controls mesh density)
BASE_R = 220               # outer radius for petal arcs
DELTA_R = 5                # decrease in radius of each inner line
EXTENT = 70                # arc angle; controls leaf shape (50..80 looks better)

# one leaf outline (two arcs making a leaf)
def draw_leaf(radius: float, extent: float):
    for _ in range(2):
        t.circle(radius, extent)   # draw arc
        t.left(180 - extent)       # turn to mirror the other side

# ---------- draw loop ----------
for i in range(PETALS):
    hue = i / PETALS
    for k in range(MESH_LINES):
        v = 1.0 - (k / (MESH_LINES * 1.6))  # fade effect
        r, g, b = colorsys.hsv_to_rgb(hue, 1.0, v)
        t.pencolor(r, g, b)
        draw_leaf(BASE_R - k * DELTA_R, EXTENT)
    t.left(360 / PETALS)  # rotate to next petal

# ---------- optional: small dark center ----------
t.up(); t.home(); t.down()
t.pencolor(0, 0, 0)
t.fillcolor(0, 0, 0)
t.begin_fill()
t.circle(18)
t.end_fill()

t.done()
