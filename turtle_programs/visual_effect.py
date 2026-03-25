import turtle, math

# Setup
s = turtle.Screen()
s.bgcolor("black")
s.tracer(0)

t = turtle.Turtle()
t.hideturtle()
t.speed(0)

points = []

# Generate circular points
for r in range(20, 160, 15):
    for a in range(0, 360, 12):
        x = r * math.cos(math.radians(a))
        y = r * math.sin(math.radians(a))
        points.append((x, y))

time_var = 0

while True:
    # ✨ FAKE TRAIL (draw transparent-like overlay manually)
    t.penup()
    t.goto(-400, -400)
    t.color(0.05, 0.05, 0.05)  # very dark gray instead of transparent
    t.begin_fill()
    for _ in range(4):
        t.forward(800)
        t.left(90)
    t.end_fill()

    # 🎧 Beat pulse
    beat = (math.sin(time_var * 0.08) + 1) / 2  

    # 🌌 Depth zoom
    zoom = 1 + 0.5 * math.sin(time_var * 0.05)

    for (x, y) in points:
        dx = x * zoom + 20 * math.sin((y + time_var) * 0.04)
        dy = y * zoom + 20 * math.cos((x + time_var) * 0.04)

        r = (math.sin(x*0.03 + time_var*0.05)+1)/2
        g = (math.sin(y*0.03 + time_var*0.05)+1)/2
        b = 1

        t.penup()
        t.goto(dx, dy)
        t.dot(6 * (0.5 + beat), (r, g, b))

    s.update()
    time_var += 2
