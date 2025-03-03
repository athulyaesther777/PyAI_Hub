#Assign values to variables
name = "Alice" # string
age = 25 # integer
height = 5.3 # float
is_student = True # boolean

print(name, age, height, is_student )
print(f"name : {name} \nage: {age} \nheight: {height} \nis_student: {is_student}")


# Datatypes
# single and double quotes
message = 'Hello, python'
print(message)

user_name = "My Name"
print(user_name)


# Multiple line string

multiple_line  = """This is a multi_line string """
print(multiple_line)


#String indexing & slicing
text = "python"  #-------------> p = 0, y = 1 ...... n = 5
print(text[0]) # First character (p)
print(text[-1]) # Last character (n)
print(text[0:3]) # Slice(pyt)
print(text[:])  # To get the whole string
print(text[::]) # To get the whole string
print(text[:3]) # slice, don't include 3rd letter
print(text[1:4]) # slice don't include the 4th letter which is o

#Numbers in Python
x = 10 # integer
y = 3.14 # Float
z = 2 + 3j # Complex

print(type(x), type(y), type(z)) # Check the types

"""
Triple quote allow us to write multi-line comments
without using (#) on each line 

Today , we learn how to print, what a string is, 
and how numbers work in python .

Slicing is an important concept in Python, 
and we will explore projects based on it in the coming days ,
You'll understand how to use it, when to use it , and why it is useful.

For now , goodbye Take care , guys ❤️
pro tip: press "windows" + "." to open the emoji picker ! 

stay tuned ! 💕
"""
