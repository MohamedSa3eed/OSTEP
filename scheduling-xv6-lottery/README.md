
# xv6 Lottery Scheduler Solution

This is a solution for the xv6 Lottery Scheduler project which implements a lottery scheduler in xv6, a simple Unix-like operating system developed for educational purposes.

## Overview

The lottery scheduler assigns each running process a slice of the processor based on the number of tickets it holds. Each process is assigned a number of tickets, and the more tickets a process holds, the more it runs. Each time slice, a randomized lottery determines the winner of the lottery; that winning process is the one that runs for that time slice.

## Getting Started

To run this solution, you need to have xv6 installed on your machine. You can download xv6 from the [official website ↗](https://pdos.csail.mit.edu/6.828/2018/xv6.html) or clone the GitHub repository:

```
git clone git://github.com/mit-pdos/xv6-public.git
```

After downloading xv6, replace the original scheduler in xv6 with the lottery scheduler by following these simple steps:

1. Copy the files `proc.c`, `proc.h`, and `pstat.h` from this repository to the corresponding locations in the xv6 source tree.
2. Build and run xv6 as usual.

## Features

This solution includes the following features:

- A lottery scheduler that assigns each process a number of tickets and uses those tickets to determine the probability of a process being chosen for the next time slice.
- Two new system calls:
  - `settickets(int number)`: sets the number of tickets of the calling process.
  - `getpinfo(struct pstat *p)`: returns information about all running processes, including how many times each process has been chosen to run and the process ID of each.
- A simple linear congruential generator for generating random numbers in the kernel.
- A Python script that generates a graph of the number of time slices a set of three processes (with a 3:2:1 ratio of tickets) receives over time, based on the output of a modified version of the `ps` command.

![image](https://github.com/MohamedSa3eed/OSTEP/blob/master/scheduling-xv6-lottery/graph/graph.png?raw=true)

The graph confirms that the lottery scheduler works as intended. In the graph, each process is represented by a different color, and the Y-axis shows the system ticks each process receives. The X-axis shows system ticks. As expected, the process with the most tickets receives the most time slices, while the process with the fewest tickets receives the fewest time slices. The graph provides a useful visualization of the scheduling algorithm in action.

## Conclusion

This solution demonstrates how to implement a lottery scheduler in xv6, modify an existing operating system to support a new scheduling algorithm, design and implement new system calls, and generate random numbers in the kernel. The solution includes a graph that confirms the proper behavior of the scheduler and provides a useful visualization of the scheduling algorithm in action.

Thank you for your interest in this project!
