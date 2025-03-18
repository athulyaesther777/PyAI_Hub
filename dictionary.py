# Python Dictionaries - Comprehensive Guide

# 1. Dictionary Creation and Basics
# Creating an empty dictionary
empty_dict = {}
# Creating a dictionary with key-value pairs
person = {'name': 'Alice', 'age': 25, 'city': 'New York'}

# 2. Accessing Elements (Key Lookup)
# Accessing values using keys
name = person['name']  # Returns 'Alice'
# Using get() to avoid KeyError
age = person.get('age', 'Not found')  # Returns 25

# 3. Adding and Updating Elements
# Adding a new key-value pair
person['email'] = 'alice@example.com'
# Updating an existing value
person['age'] = 26

# 4. Removing Elements (del, pop(), popitem())
# Using del to remove a key-value pair
del person['city']
# Using pop() to remove and return a value
email = person.pop('email', 'Not found')
# Using popitem() to remove and return the last inserted item
last_item = person.popitem()

# 5. Dictionary Methods
keys = person.keys()  # Get all keys
values = person.values()  # Get all values
items = person.items()  # Get all key-value pairs
# Clear the dictionary
person.clear()
# Copy the dictionary
person_copy = person.copy()
# Update dictionary with another dictionary
person.update({'name': 'Bob', 'age': 30})

# 6. Dictionary Operations
# Length of dictionary
length = len(person)
# Membership testing
has_name = 'name' in person
# Merging dictionaries
extra_info = {'profession': 'Engineer'}
person.update(extra_info)

# 7. Dictionary Comprehension
squares = {x: x * x for x in range(5)}

# 8. Nesting Dictionaries
nested_dict = {'person1': {'name': 'John', 'age': 30}, 'person2': {'name': 'Emma', 'age': 25}}

# 9. Iterating through a Dictionary
for key, value in person.items():
    print(f'{key}: {value}')

# 10. Handling Missing Keys (Using get() and defaultdict)
# Using get() to handle missing keys
height = person.get('height', 'Unknown')
# Using defaultdict from collections
from collections import defaultdict
scores = defaultdict(lambda: 0)
scores['math'] = 90
print(scores['science'])  # Returns 0 (default value)

# 11. Sorting Dictionaries
sorted_by_key = dict(sorted(person.items()))
sorted_by_value = dict(sorted(person.items(), key=lambda item: item[1]))

# 12. Advanced Dictionary Techniques
# Using setdefault()
name = person.setdefault('name', 'Unknown')
# Using dict.fromkeys() to create a dictionary with default values
defaults = dict.fromkeys(['a', 'b', 'c'], 0)

# 13. Advantages and Limitations of Dictionaries
# Advantages:
# - Fast lookup and retrieval
# - Flexible key types (immutable)
# Limitations:
# - Unordered (in older versions)
# - Memory-intensive compared to lists

# 14. Best Practices and Use Cases
# - Use meaningful key names
# - Choose keys of immutable types (e.g., strings, numbers)
# - Use get() to avoid KeyError
# - Use defaultdict when default values are needed
