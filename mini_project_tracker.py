# mini_project_tracker.py
# A beginner-friendly mini-project combining previous lessons
# This program stores user info, favorite fruits, and favorite colors

# Function to greet the user
def greet_user(name, age):
    print(f"\nHello, {name}! You are {age} years old.")
    if age >= 18:
        print("You are an adult.")
    elif 13 <= age <= 19:
        print("You are a teenager.")
    else:
        print("You are a child.")

# Function to display favorite fruits
def show_fruits(fruit_list):
    print("\nYour favorite fruits are:")
    for fruit in fruit_list:
        print("-", fruit)

# Function to display favorite colors dictionary
def show_colors(color_dict):
    print("\nFavorite colors so far:")
    for name, color in color_dict.items():
        print(name, "likes", color)

# Step 1: Ask user for name and age
name = input("Enter your name: ")
age = int(input("Enter your age: "))

# Greet the user
greet_user(name, age)

# Step 2: Work with favorite fruits
fruits = ["apple", "banana", "cherry"]
print("\nCurrent fruits:", fruits)
new_fruit = input("Enter a fruit to add to your list: ")
fruits.append(new_fruit)
show_fruits(fruits)

# Step 3: Work with favorite colors
favorite_colors = {
    "Alice": "Blue",
    "Bob": "Green",
    "Charlie": "Red"
}

while True:
    print("\nColor Menu:")
    print("1. Add or update favorite color")
    print("2. Show all favorite colors")
    print("3. Exit")

    choice = input("Enter your choice (1-3): ")

    if choice == "1":
        color_name = input("Enter name: ")
        color = input("Enter favorite color: ")
        favorite_colors[color_name] = color
        print(f"{color_name}'s favorite color has been updated.")
    elif choice == "2":
        show_colors(favorite_colors)
    elif choice == "3":
        print("Exiting program. Goodbye!")
        break
    else:
        print("Invalid choice. Please enter 1, 2, or 3.")
