# Import required libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn.tree import plot_tree

# Step 1: Load the Iris dataset
iris = datasets.load_iris()

# Convert it into a DataFrame for better visualization
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['target'] = iris.target  # Add the target column

# Display the first few rows
print("First 5 rows of the dataset:")
print(df.head())

# Step 2: Split data into training and testing sets
X = iris.data  # Features
y = iris.target  # Labels

# Splitting 80% training and 20% testing
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

print(f"Training data size: {X_train.shape}, Testing data size: {X_test.shape}")

# Step 3: Train the Decision Tree Model
model = DecisionTreeClassifier()  # Create the classifier
model.fit(X_train, y_train)  # Train the model

print("Model training completed!")

# Step 4: Make Predictions and Evaluate
y_pred = model.predict(X_test)  # Make predictions

# Calculate accuracy
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy * 100:.2f}%")

# Step 5: Visualize the Decision Tree
plt.figure(figsize=(12, 8))
plot_tree(model, feature_names=iris.feature_names, class_names=iris.target_names, filled=True)
plt.show()
