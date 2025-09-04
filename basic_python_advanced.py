# basic_python_advanced.py
# Continuation of basic_python_intro.py
# This program adds user input, functions, and lists

# Function to greet the user
def greet_user(name):
    print("Hello,", name, "nice to meet you!")

# Ask the user for their name and age
name = input("Enter your name: ")  # user input for name
age = int(input("Enter your age: "))  # user input for age, converted to integer

# Call the function to greet
greet_user(name)

# Check if the user is a teenager
if 13 <= age <= 19:
    print("You are a teenager.")
else:
    print("You are not a teenager.")

# Working with lists
fruits = ["apple", "banana", "cherry"]  # a list of fruits
print("Here are some fruits:", fruits)

# Add a fruit entered by the user
new_fruit = input("Enter a fruit to add to the list: ")
fruits.append(new_fruit)
print("Updated list of fruits:", fruits)

# Loop through the list and print each fruit
for fruit in fruits:
    print("I like", fruit)
