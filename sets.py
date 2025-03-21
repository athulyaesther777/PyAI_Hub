# Create a set fruits
fruits = {"apple","banana", "cherry","mango"}
print("Fruits set:", fruits)

# try adding a element
fruits.add("banana")
fruits.add("avocado")

print("After adding duplicate element", fruits)

# update method
fruits.update(["grapes","kiwi", "pineapple"])
print("After adding multiple fruits :",fruits)


# remove method
fruits.remove("cherry")
print("After removing cherry :", fruits)


# Discard method
fruits.discard("kiwi")
fruits.discard("melon")
print("After using discard:", fruits)

# to get the arbitrary using pop() method
popped_item = fruits.pop()
print(f"popped item: {popped_item} and fruits: {fruits}")

# Clearing () entire set
fruits.clear()
print("After clearing the set:", fruits)

# Deleting the entire set
del fruits
# the set is no longer available
# print(fruits)