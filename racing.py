# Import the necessary libraries
import random  # For generating random speed variations
import matplotlib.pyplot as plt  # For data visualization
import time  # For adding delays to simulate race progress

# Define racing cars as tuples (car_name, base_speed)
cars = (
    ("Lightning Bolt", random.randint(20, 30)),  # Car with a random base speed between 20 and 30
    ("Thunder Storm", random.randint(20, 30)),  # Another car with similar speed range
    ("Speed Demon", random.randint(20, 30)),  # Fast car with dynamic speed
    ("Road Runner", random.randint(20, 30)),  # Consistent speed car
    ("Blaze Fury", random.randint(20, 30))  # Fiery car with a speed boost
)

# Print the start message
print("🚦 Starting the Professional Racing Simulation...\n")
time.sleep(1)  # Pause for 1 second to build excitement

# Lap data storage - stores distances covered by each car per lap
lap_count = 10  # Number of laps in the race
lap_results = {car[0]: [] for car in cars}  # Dictionary to store lap results for each car

# Start the racing simulation
for lap in range(1, lap_count + 1):  # Loop through each lap
    print(f"Lap {lap}/{lap_count} in progress...")  # Print the current lap number

    for car in cars:  # Loop through each car
        # Generate speed variation and calculate lap distance
        speed = car[1] * random.uniform(0.8, 1.2)  # Speed variation between 80% to 120% of base speed
        lap_results[car[0]].append(speed)  # Append the speed for this lap to the car's results

    time.sleep(0.5)  # Small delay to mimic lap progression

# Calculate total distance covered by each car
total_distances = {car[0]: sum(lap_results[car[0]]) for car in cars}  # Sum of all lap distances per car

# Determine the race winner based on the maximum distance covered
winner = max(total_distances, key=total_distances.get)  # Find the car with the maximum total distance
print(f"\n🏆 The race has concluded! {winner} wins with a total distance of {total_distances[winner]:.2f} km! 🎉\n")

# Plotting the race progress using Matplotlib
plt.figure(figsize=(10, 6))  # Create a figure with a specified size

# Loop through each car to plot its progress
for car, speeds in lap_results.items():
    # Calculate cumulative distance covered for each lap
    distances = [sum(speeds[:i + 1]) for i in range(len(speeds))]  # Cumulative sum of distances
    # Plot the distance progress for each car
    plt.plot(range(1, lap_count + 1), distances, marker='o', label=car)

# Add a title and labels to the plot
plt.title("Professional Racing Simulation - Distance Over Laps")
plt.xlabel("Lap Number")  # X-axis label
plt.ylabel("Distance Covered (km)")  # Y-axis label
plt.legend()  # Display the legend with car names
plt.grid(True)  # Add a grid to the plot for better visibility
plt.show()  # Display the final plot
