# 1. Creating a list with mixed data types
my_list = [10, "Python", 3.14, True]  # List with integer, string, float, and boolean
print("Original List:", my_list)

# 2. Accessing elements using positive and negative indexing
print("First Element:", my_list[0])   # Accessing the first element
print("Last Element:", my_list[-1])   # Accessing the last element

# 3. Slicing the list
print("Slice from index 1 to 3:", my_list[1:3])  # Slice from index 1 to 3 (exclusive)

# 4. Updating an element in the list
my_list[1] = "Advanced Python"  # Changing the second element
print("Updated List:", my_list)

# 5. Adding elements using append() and insert()
my_list.append("New Item")       # Append adds at the end
print("After Append:", my_list)
my_list.insert(2, "Inserted")    # Insert adds at the specified position
print("After Insert:", my_list)

# 6. Removing elements using remove(), pop(), and del
my_list.remove("Inserted")       # Remove specified value
print("After Remove:", my_list)
popped = my_list.pop()           # Pop the last element
print("Popped Element:", popped)
print("After Pop:", my_list)
del my_list[0]                   # Delete element at index 0
print("After Deletion:", my_list)

# 7. Clearing the entire list
my_list.clear()                  # Removes all elements
print("Cleared List:", my_list)

# 8. Copying a list
original = [1, 2, 3]
copied = original.copy()         # Create a shallow copy
print("Original:", original)
print("Copied:", copied)

# 9. List comprehension for creating a new list from an existing one
squares = [x ** 2 for x in range(5)]  # Generates squares of numbers 0-4
print("List Comprehension (Squares):", squares)

# 10. Filtering elements using list comprehension
even_numbers = [x for x in range(10) if x % 2 == 0]  # Filter even numbers
print("Filtered Even Numbers:", even_numbers)

# 11. Mapping elements to new values
names = ["Alice", "Bob", "Charlie"]
upper_names = list(map(str.upper, names))  # Convert each name to uppercase
print("Mapped Names:", upper_names)

# 12. Sorting a list (ascending and descending)
numbers = [5, 3, 8, 1, 2]
numbers.sort()                # Ascending sort
print("Sorted (Ascending):", numbers)
numbers.sort(reverse=True)    # Descending sort
print("Sorted (Descending):", numbers)

# 13. Using sorted() without modifying the original list
sorted_numbers = sorted(numbers)  # Temporary sorting
print("Sorted with sorted():", sorted_numbers)
print("Original after sorted():", numbers)

# 14. Finding the maximum and minimum in a list
print("Maximum value:", max(numbers))
print("Minimum value:", min(numbers))

# 15. Calculating the sum of elements
print("Sum of numbers:", sum(numbers))

# 16. Counting occurrences of an element
print("Count of 3:", numbers.count(3))

# 17. Finding the index of a specific value
print("Index of 8:", numbers.index(8))

# 18. Reversing the list
numbers.reverse()
print("Reversed List:", numbers)

# 19. Nested Lists (List of Lists)
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print("Matrix:", matrix)
print("Accessing Element [1][2]:", matrix[1][2])  # Accessing row 1, column 2

# 20. Flattening a nested list using list comprehension
flat = [num for row in matrix for num in row]
print("Flattened Matrix:", flat)

# 21. Zipping two lists together
names = ["Tom", "Jerry", "Spike"]
ages = [5, 3, 7]
zipped = list(zip(names, ages))  # Pairing elements from two lists
print("Zipped List:", zipped)

# 22. Unzipping a list of tuples
unzipped = list(zip(*zipped))  # Unpacking zipped list
print("Unzipped Names:", unzipped[0])
print("Unzipped Ages:", unzipped[1])

# 23. Checking if a list is empty
if not numbers:
    print("The list is empty")
else:
    print("The list is not empty")

# 24. Finding unique elements using set()
unique_numbers = list(set([1, 2, 2, 3, 4, 4, 5]))  # Removes duplicates
print("Unique Elements:", unique_numbers)

# 25. Merging two lists using the + operator
merged_list = [1, 2, 3] + [4, 5, 6]
print("Merged List:", merged_list)

# 26. Using extend() to combine lists
list1 = [1, 2, 3]
list2 = [4, 5, 6]
list1.extend(list2)  # Combines list2 into list1
print("Extended List:", list1)

# 27. Looping through a list using enumerate()
for index, value in enumerate(names):
    print(f"Index {index}: {value}")

# 28. Using list() to convert a tuple to a list
tuple_data = (10, 20, 30)
list_data = list(tuple_data)  # Convert tuple to list
print("Converted List from Tuple:", list_data)

# 29. Using the * operator for unpacking
numbers = [1, 2, 3]
print("Unpacked Elements:", *numbers)

# 30. Nested list comprehensions
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
squared_matrix = [[x ** 2 for x in row] for row in matrix]  # Squaring each element
print("Squared Matrix:", squared_matrix)
