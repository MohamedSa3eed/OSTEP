
# Unix Shell

## Overview

A *command line interpreter (CLI)* or,as it is more commonly known, a *shell*. 
The shell operates in this basic way: 
when you type in a command (in response to its prompt), the shell
creates a child process that executes the command you entered and then prompts
for more user input when it has finished.

It is  similar to, but simpler than, the one you run
every day in Linux. 

## Program Specifications

This program follows all the specifications [here](https://github.com/remzi-arpacidusseau/ostep-projects/tree/master/processes-shell) and passes all the test cases.

## Build

### Linux / MacOS

```
$ make
```

### Windows

If you are using Windows 10 or 11 , you can use the Windows Subsystem for Linux (WSL) to be able to use unix utilities [Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

##Run

```
$ make run
```

## Testing

```
$ ./test-wish.sh -c
```
That will run all the test cases 
