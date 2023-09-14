
# Kernel Threads
This repository contains my solution to the Concurrency-xv6-threads assignment from the Operating Systems: Three Easy Pieces (OSTEP) book.

## Solution Overview

My solution provides an implementation of the required functionalities in the xv6 operating system. Here's an overview of the key components:

![image](https://github.com/MohamedSa3eed/OSTEP/edit/master/concurrency-xv6-threads/graph/Diagram.png?raw=true)

### System Calls

1. `clone(void(*fcn)(void *, void *), void *arg1, void *arg2, void *stack)`: This system call creates a new kernel thread that shares the calling process's address space. It copies file descriptors similar to `fork()`. The new thread uses the specified `stack` as its user stack and starts executing at the address specified by `fcn`. The function arguments `arg1` and `arg2` are passed to the thread. The parent process receives the PID of the new thread.

2. `join(void **stack)`: This system call waits for a child thread that shares the address space with the calling process to exit. It returns the PID of the waited-for child thread or -1 if none. The location of the child's user stack is copied into the `stack` argument.

### Thread Library

I have implemented a simple thread library on top of the system calls. The library provides the following functions:

1. `int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2)`: This function creates a new user stack using `malloc()`, uses `clone()` to create a child thread, and gets it running. It returns the newly created thread's PID to the parent process and 0 to the child. If the creation fails, it returns -1.

2. `int thread_join()`: This function calls the underlying `join()` system call, frees the user stack, and returns the waited-for PID (when successful). Otherwise, it returns -1.

### Ticket Lock

I have implemented a ticket lock using the `lock_t` type. The lock can be acquired using `lock_acquire()` and released using `lock_release()`. The spin lock is built using the x86 atomic fetch-and-add operation (`xaddl` instruction).

## Programs

I have provided two additional programs to test the functionality of the implemented thread library and lock APIs:

1. `test1.c`: This program demonstrates the usage of the thread library by creating multiple threads and passing arguments to them. It tests the correctness of thread creation, stack allocation, and argument passing. To run the test, type `test1` in the xv6 shell.

2. `test2.c`: This program tests the functionality of the lock APIs and atomic operations. It creates multiple threads that compete for a shared resource protected by a ticket lock. The program verifies that the lock properly synchronizes the threads and ensures mutual exclusion. To run the test, type `test2` in the xv6 shell.

## Getting Started

To use my solution and test the programs, follow these steps:

1. Clone this repository: `git clone https://github.com/MohamedSa3eed/OSTEP.git`
2. Navigate to the `concurrency-xv6-threads/src` directory: `cd OSTEP/concurrency-xv6-threads/src`
3. Build the xv6 operating system by running the command: `make`
4. Start xv6 using QEMU by running the command: `make qemu`
5. To run `test1.c`, type `test1` in the xv6 shell.
5. To run `test2.c`, type `test2` in the xv6 shell.

## Additional Resources

For more information on the assignment and the concepts involved, refer to the following resources:

- [Operating Systems: Three Easy Pieces (OSTEP) book](http://pages.cs.wisc.edu/~remzi/OSTEP/)
- [Concurrency-xv6-threads Assignment Description](http://pages.cs.wisc.edu/~remzi/OSTEP/threads-cv.pdf)

Feel free to explore the code and modify it according to your needs. If you have any questions or suggestions, please feel free to reach out.

