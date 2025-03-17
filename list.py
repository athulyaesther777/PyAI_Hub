# 1. Creating Lists
# Creating a list of strings
fruits = ["apple", "banana", "cherry"]
print("Fruit List:", fruits)

# Creating a list of numbers
numbers = [1, 2, 3, 4, 5]
print("Number List:", numbers)

# Creating a mixed data type list
mixed = ["hello", 42, 3.14, True]
print("Mixed List:", mixed)

# 2. Accessing Elements (Indexing and Slicing)
# Accessing elements by index
print("First fruit:", fruits[0])  # Accessing the first element
print("Last fruit:", fruits[-1])  # Accessing the last element

# Slicing a list to get a sublist
print("First two fruits:", fruits[0:2])  # Getting the first two elements
print("All fruits from second:", fruits[1:])  # From second to end
print("Reversed list:", fruits[::-1])  # Reversing the list

# 3. Modifying Lists (Adding, Removing, Updating)
# Adding elements using append()
fruits.append("mango")
print("After append:", fruits)

# Inserting an element at a specific index
fruits.insert(1, "orange")
print("After insert at index 1:", fruits)

# Removing an element using remove()
fruits.remove("banana")
print("After remove:", fruits)

# Removing the last element using pop()
last_fruit = fruits.pop()
print("Popped fruit:", last_fruit)
print("After pop:", fruits)

# Updating an element
fruits[0] = "grape"
print("After updating first element:", fruits)

# 4. List Methods
# Counting occurrences of an element
count_cherry = fruits.count("cherry")
print("Count of 'cherry':", count_cherry)

# Finding the index of an element
index_grape = fruits.index("grape")
print("Index of 'grape':", index_grape)

# Extending a list with another list
fruits.extend(["pineapple", "kiwi"])
print("After extend:", fruits)

# Clearing the list
fruits.clear()
print("After clear:", fruits)

# 5. List Operations
# Concatenation of lists
combined = numbers + [6, 7, 8]
print("Concatenated list:", combined)

# Repeating elements
repeated = numbers * 3
print("Repeated list:", repeated)

# Checking membership
is_five_present = 5 in numbers
print("Is 5 present:", is_five_present)

# 6. List Comprehension
# Creating a new list with squares of numbers
squares = [x * x for x in numbers]
print("Squares:", squares)

# Filtering even numbers
evens = [x for x in numbers if x % 2 == 0]
print("Even numbers:", evens)

# 7. Copying a List
# Shallow copy using copy() method
numbers_copy = numbers.copy()
print("Copied list:", numbers_copy)

# Deep copy using list() constructor
deep_copy = list(numbers)
print("Deep copied list:", deep_copy)

# 8. Sorting and Reversing
# Sorting a list in ascending order
numbers.sort()
print("Sorted list:", numbers)

# Sorting in descending order
numbers.sort(reverse=True)
print("Sorted in descending order:", numbers)

# Reversing a list
numbers.reverse()
print("Reversed list:", numbers)

# 9. Nested Lists
# Creating a list of lists
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print("Matrix:", matrix)

# Accessing nested list elements
print("Element at row 2, col 3:", matrix[1][2])

# 10. Iterating through a List
# Iterating using a for loop
for fruit in ["apple", "banana", "cherry"]:
    print("Fruit:", fruit)

# Iterating with index using enumerate()
for index, value in enumerate(numbers):
    print(f"Index {index}: {value}")

# 11. List Length
# Getting the length of a list
length = len(numbers)
print("Length of numbers list:", length)

# 12. Removing Duplicates from a List
# Converting to a set to remove duplicates, then back to list
unique_numbers = list(set([1, 2, 2, 3, 4, 4, 5]))
print("Unique numbers:", unique_numbers)

# 13. Flattening a Nested List
# Flattening a 2D list using a list comprehension
flattened = [item for sublist in matrix for item in sublist]
print("Flattened matrix:", flattened)
