import turtle

# Setup screen
screen = turtle.Screen()
screen.bgcolor("black")

t = turtle.Turtle()
t.speed(0)          # max speed
t.color("white")
t.hideturtle()

def draw_triangle(points):
    t.up()
    t.goto(points[0])
    t.down()
    t.goto(points[1])
    t.goto(points[2])
    t.goto(points[0])

def midpoint(p1, p2):
    return ((p1[0]+p2[0])/2, (p1[1]+p2[1])/2)

def sierpinski(points, depth):
    if depth == 0:
        draw_triangle(points)
    else:
        sierpinski([points[0],
                    midpoint(points[0], points[1]),
                    midpoint(points[0], points[2])], depth-1)

        sierpinski([points[1],
                    midpoint(points[0], points[1]),
                    midpoint(points[1], points[2])], depth-1)

        sierpinski([points[2],
                    midpoint(points[2], points[1]),
                    midpoint(points[0], points[2])], depth-1)

points = [(-200, -100), (0, 200), (200, -100)]

# IMPORTANT: turn animation ON (default behavior)
turtle.tracer(1)

sierpinski(points, 5)

turtle.done()
