# python turtle code for beautiful design in python
import turtle

t = turtle.Turtle()
s = turtle.Screen()

s.bgcolor('black')
t.width(1)
t.speed(25)

col = ('blue', 'turquoise', 'purple')
for i in range(500):
    t.pencolor(col[i % len(col)])
    t.forward(i * 4)
    t.right(121)

turtle.done()
