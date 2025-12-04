print("Welcome to your Personal Info Card Generator!")

# Asking for basic details
name = input("Enter your name: ")
age = int(input("Enter your age: "))

# Taking DOB as a tuple
dob = (
    input("Enter birth day: "),
    input("Enter birth month: "),
    input("Enter birth year: ")
)

# Taking hobbies and favorite foods as lists
hobbies = input("Enter your hobbies separated by commas: ").split(",")
foods = input("Enter your favorite foods separated by commas: ").split(",")

# Storing everything inside a dictionary
info = {
    "Name": name,
    "Age": age,
    "Date of Birth": dob,
    "Hobbies": hobbies,
    "Favorite Foods": foods
}

print("\n--- Your Personal Info Card ---")
for key, value in info.items():
    print(f"{key}: {value}")

# Simple age calculation
year = 2025
birth_year = int(dob[2])
print(f"You will turn {year - birth_year} in {year}.")

print("Thanks for using the generator!")
