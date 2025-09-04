# basic_python_intro.py
# This is a simple Python program to learn basics

# Print a welcome message
print("Hello, welcome to Python!")

# Variables: storing data
name = "Alice"   # string variable
age = 20         # integer variable

# Print variables
print("My name is", name)
print("I am", age, "years old")

# Simple arithmetic
num1 = 10
num2 = 5
sum = num1 + num2   # addition
print("Sum of", num1, "and", num2, "is", sum)

# Conditional statement
if age >= 18:
    print("You are an adult.")
else:
    print("You are not an adult.")

# Loop example: print numbers 1 to 5
for i in range(1, 6):
    print("Number:", i)
