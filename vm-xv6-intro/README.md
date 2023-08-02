
# Intro To xv6 Virtual Memory

This repository contains solution code for the virtual memory project of OSTEP. The code is implemented in the xv6 operating system, a simple Unix-like operating system developed for educational purposes.

## Preventing Null Dereference

In the original xv6 operating system, null dereference was not treated as an error and programs could read or write to null pointers without any issues. However, null dereference can lead to unexpected behavior and crashes in programs, which is why many modern operating systems treat it as an error.

the solution to prevent null dereference is by using the PGFLT page fault exception. When a program attempts to access memory that is not mapped to a physical address, the operating system generates a page fault exception, the page fault handler checks if the access is to a null pointer and generates a "trap error" message if it is

## Read-only Code

In most operating systems, code is marked read-only instead of
read-write. However, in xv6 this is not the case, so a buggy program could
accidentally overwrite its own text.
To prevent modification of read-only code, the virtual memory solution presented in the two system calls:`int mprotect(void *addr, int len)` 
and `int munprotect(void *addr, int len)`. The mprotect() system call can be used to mark a range of memory pages as read-only. The munprotect() system call can be used to remove the read-only protection from a range of memory pages.

## Handling Illegal Accesses

In both the cases above, when
user code tries to (a) access a null pointer or (b) overwrite an mprotected
region of memory. In both cases, xv6 should trap and kill the process.

## Table of Contents

- [Getting Started](#getting-started)
- [Code Organization](#code-organization)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)
- [Acknowledgments](#acknowledgments)

## Getting Started

To get started, you will need to have xv6 installed on your system. You can follow the instructions in the [xv6 repository](https://github.com/AnubisLMS/xv6) to download and build xv6.

After you have xv6 installed, you can clone this repository to your system:

```
git clone https://github.com/MohamedSa3eed/OSTEP.git
cd OSTEP/vm-xv6-intro/src
```

## Code Organization

The code for this project is organized into the following directories:

- `src`: Contains the source code for the virtual memory changes to xv6. The main file is `vm.c`.

## Usage

To build the virtual memory changes to xv6, run the following command:

```
make
```

This will generate a `kernel` binary that you can use to run xv6 with the virtual memory changes.

To run xv6 with the virtual memory changes, use the following command:

```
make qemu
```

This will start qemu and run xv6 with virtual memory enabled.

## Testing

This project includes the following test programs to verify that the virtual memory changes are working correctly:

- `null`: Tests null dereference by attempting to write to the NULL pointer. This should generate a "trap error" message.

  ```
  null
  ```

- `test1`: Tests the `mprotect` system call by attempting to write to a read-only page of memory. This should generate a "trap error" message.

  ```
  test1
  ```

- `test2`: Tests the `munprotect` system call by allocating a page of memory, making it read-only using `mprotect`, and then attempting to write to the page. After calling `munprotect`, the program should be able to write to the page without generating a "trap error" message.

  ```
  test2
  ```

## Contributing

If you find any issues with this project or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## Acknowledgments

This project was created as part of the Operating Systems Three Easy Pieces (OSTEP) book by Remzi H. Arpaci-Dusseau and Andrea C. Arpaci-Dusseau. The xv6 operating system was created by MIT.
