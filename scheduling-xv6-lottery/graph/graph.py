import matplotlib.pyplot as plt

# Define the x-values
system_ticks = [0 , 623 , 1824 , 3520 , 5591 , 8327]

# Define the y-values for each function
process_1_ticks = [0, 98 , 199 , 285 , 356 ,466]
process_2_ticks = [0, 203 , 379 , 551,677 , 897]
process_3_ticks = [0, 318 , 623 , 860 ,1038 ,1373]

# Create a new figure and axis
fig, ax = plt.subplots()

# Plot each function with a different color and shape
ax.plot(system_ticks, process_1_ticks, 'b-', label='process 1 with 10 tickets')
ax.plot(system_ticks, process_2_ticks, 'r-', label='process 2 with 20 tickets')
ax.plot(system_ticks, process_3_ticks, 'g-', label='process 3 with 30 tickets')

# Add a legend and axis labels
ax.legend()
ax.set_xlabel('system ticks')
ax.set_ylabel('process ticks')
ax.set_title('Lottery scheduling for three processes in XV6')

# Show the plot
plt.show()
