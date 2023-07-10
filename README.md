
# Projects for an Operating Systems Class

This repository holds my code for projects of [operating systems course](https://pages.cs.wisc.edu/~remzi/Classes/537/Spring2018/).

Also (increasingly) available are some tests to check my code ;
every project have a set of tests available. The testing framework that is
currently available is found [here](https://github.com/remzi-arpacidusseau/ostep-projects/tree/master/tester).
A specific testing script, found in each project directory, can be used to run
the tests against the code. 

For example, in the initial utilities project, the relatively simple `wcat`
program that you create can be tested by running the `test-wcat.sh` script.
This could be accomplished by the following commands:
```sh
prompt> git clone https://github.com/remzi-arpacidusseau/ostep-projects
prompt> cd ostep-projects/initial-utilities/wcat
prompt> emacs -nw wcat.c 
prompt> gcc -o wcat wcat.c -Wall 
prompt> ./test-wcat.sh
test 1: passed
test 2: passed
test 3: passed
test 4: passed
test 5: passed
test 6: passed
test 7: passed
prompt> 
```

# Projects

## C/Linux Projects

### Initial Projects

- [x]  [Unix Utilities](initial-utilities) (cat, grep, zip/unzip)

### Processes and Scheduling

- [x]  [Shell](processes-shell)

### Concurrency

- [ ]  [Web Server](concurrency-webserver)
- [ ]  [Parallel Zip](concurrency-pzip)
- [ ]  [MapReduce](concurrency-mapreduce)

### File Systems

- [ ] [File System Checker](filesystems-checker)



## Kernel Hacking Projects (xv6)

These projects all are to be done inside the
[xv6](https://pdos.csail.mit.edu/6.828/2017/xv6.html) kernel based on an early
version of Unix and developed at MIT. Unlike the C/Linux projects, these give
you direct experience inside a real, working operating system (albeit a simple
one).

Read the [install notes](INSTALL-xv6.md) to see how to download the latest xv6 
and install the tools.

### Initial Projects

- [x] [Intro To xv6](initial-xv6)

### Processes and Scheduling

- [x] [Scheduling (Lottery)](scheduling-xv6-lottery)

### Virtual Memory

- [ ] [Virtual Memory (Null Pointer and Read-Only Regions)](vm-xv6-intro)

### Concurrency

- [ ] [Kernel Threads (Basic Implementation)](concurrency-xv6-threads)

