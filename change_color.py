import tkinter as tk
import random
import argparse

# Function to change the bg color randomly
def change_color():
    colors = ['red','blue', 'green', 'yellow','purple', 'orange']
    random_color = random.choice(colors)
    root.config(bg=random_color)  

#parse command_line arg
def parse_args():
    parser = argparse.ArgumentParser(description="Change window settings.")
    parser.add_argument('--color', type=str, help="Initial window background color", default='white')
    parser.add_argument('--size', type=str, help="Window size in WIDTHxHEIGHT format", default='400x400')
    return parser.parse_args()

# Main execution
if __name__ == "__main__":
    args = parse_args() 

    # Create the main window
    root = tk.Tk()
    root.title("Random Color Changer")

    # Set initial window size from command-line argument
    root.geometry(args.size)

    # Set the initial background color from command-line argument
    root.config(bg=args.color)

    # Add a button that triggers the color change
    button = tk.Button(root, text="Change Color", command=change_color, font=("Arial", 14))
    button.pack(pady=20)

    # Run the application
    root.mainloop()
