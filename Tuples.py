# Create a tuple
fruits = ("apple", "banana", "cherry", "apple")
print(fruits)      
print("Fruits:", fruits)       
     
#  Accessing the elements in Tuples (Indexing and slicing )  
print("First fruit:", fruits[0]) 
print("Last fruit:", fruits[-1]) 
print("Fruit at index 2:", fruits[2]) 
 
# slicing
print("Slicing Tuple:", fruits[0:2])
print(fruits[:])

# trying to change tuple element (will raise error)
try: 
    fruits[1] = "orange"
except TypeError as e:
    print("Error:", e )

# Tuple Methods(count() and index())

# count the occurrence of element and finding the index
print("Count apple in fruits:", fruits.count("apple"))
print("Index of apple:", fruits.index("apple"))

# single tuple
colors = ("blue", )
print("Single Tuple:", colors)

print(fruits)
# Tuple Operations (Concatenation, repetition and membership testing)
new_tuple = fruits + ("mango",)
print("Concatenated Tuple:",new_tuple)
repeated = fruits * 2
print("Repeated Tuple:", repeated)
is_apple_present = "apple" in fruits
print("Is apple present:", is_apple_present)
is_guva_present = "guva" in fruits
print("Is guva present:", is_guva_present)

# Packing and unpacking
# packing a tuple
packed_tuple = "apple", "banana", "cherry"

# Unpacking
fruit1, fruit2, fruit3 = packed_tuple
print("Packed tuple:", packed_tuple)
print("Unpacked Tuple:", fruit1, fruit2, fruit3)
print(fruit3)

# Extended unpacking
a, b, *c, d = fruits
print("First:", a)
print("Middle:",b)
print("3rd:", c)
print("Last:", d)


# Nested Tuples
# Create a nested tuple
nested_tuple = (fruits,colors,(1, 2, 3))
print("Nested_tuple:", nested_tuple)
print("nested tuple :" ,nested_tuple[0][1])

nested_tuple2 = ("apple",("orange", "guva"),"cherry")
print("nested tuple 2 :", nested_tuple2)
print("Second tuple:", nested_tuple2[1])
print("Access orange:", nested_tuple2[1][0])


# iterating through a tuple
for fruits in fruits:
    print("Fruits:", fruits)


