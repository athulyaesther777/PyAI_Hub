import turtle
import colorsys
import math

# Screen setup
screen = turtle.Screen()
screen.bgcolor("black")
screen.title("Advanced Python Spiral Art")

# Turtle setup
pen = turtle.Turtle()
pen.speed(0)
pen.width(2)
pen.hideturtle()

turtle.colormode(1)

# Main drawing loop
for i in range(360):
    # Create smooth rainbow color transition
    r, g, b = colorsys.hsv_to_rgb(i / 360, 1, 1)
    pen.pencolor(r, g, b)

    # Spiral math pattern
    pen.right(137.5)  # Golden angle for aesthetic symmetry
    pen.forward(i * 0.8)
    pen.circle(i * 0.3)

# Keep window open
screen.mainloop()
