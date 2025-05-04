import matplotlib.pyplot as plt

with open("bench.txt") as file:
    lines = [float (line.rstrip()) for line in file]
fig, ax = plt.subplots()             # Create a figure containing a single Axes.
ax.plot([1, 2, 3, 4, 5, 6, 7, 8,9,10, 11, 12, 13, 14, 15, 16], lines)  # Plot some data on the Axes.
plt.show()                           # Show the figure.

