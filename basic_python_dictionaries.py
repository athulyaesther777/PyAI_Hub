# basic_python_dictionaries.py
# Continuation from basic_python_advanced.py
# This program introduces dictionaries and while loops

# Create a dictionary to store favorite colors
favorite_colors = {
    "Alice": "Blue",
    "Bob": "Green",
    "Charlie": "Red"
}

# Function to display the dictionary
def show_colors():
    print("\nFavorite colors so far:")
    for name, color in favorite_colors.items():
        print(name, "likes", color)

# Menu-driven program using a while loop
while True:
    print("\nMenu:")
    print("1. Add or update favorite color")
    print("2. Show all favorite colors")
    print("3. Exit")

    choice = input("Enter your choice (1-3): ")

    if choice == "1":
        name = input("Enter name: ")
        color = input("Enter favorite color: ")
        favorite_colors[name] = color  # Add or update
        print(name + "'s favorite color has been updated.")
    elif choice == "2":
        show_colors()  # Call function to display all colors
    elif choice == "3":
        print("Exiting program. Goodbye!")
        break  # Exit the loop
    else:
        print("Invalid choice. Please enter 1, 2, or 3.")
