# Save as flower_turtle.py and run: python flower_turtle.py
import turtle
import math
screen = turtle.Screen()
screen.bgcolor("#061322")
screen.title("Turtle Flower")

t = turtle.Turtle()
t.hideturtle()
t.speed(0)
t.width(2)

def draw_petal(radius, angle, color1, color2):
    t.color(color1)
    t.begin_fill()
    t.circle(radius, angle)
    t.left(180-angle)
    t.circle(radius, angle)
    t.left(180 - (360/num_petals))
    t.end_fill()

# parameters
num_petals = 12
petal_radius = 120
petal_angle = 60
colors = ["#ff7ab6", "#ffbe7a", "#ffd47a", "#ff8c9a"]

# move to center
t.up()
t.goto(0, -20)
t.down()

# draw petals
for i in range(num_petals):
    t.fillcolor(colors[i % len(colors)])
    t.begin_fill()
    t.setheading(i * (360/num_petals))
    t.circle(petal_radius, petal_angle)
    t.left(180 - petal_angle)
    t.circle(petal_radius, petal_angle)
    t.end_fill()

# center
t.up()
t.goto(0, -10)
t.down()
t.color("#ffb84d")
t.begin_fill()
t.circle(30)
t.end_fill()

# add small dots in center
t.up()
t.goto(0,10)
t.down()
t.color("#fff3c8")
for i in range(8):
    t.up()
    t.forward(8)
    t.down()
    t.begin_fill()
    t.circle(3)
    t.end_fill()
    t.up()
    t.backward(8)
    t.right(45)

t.hideturtle()
turtle.done()
