
# Parallel Zip

Concurrency PZip is a command-line utility that compresses one or more files using parallel processing. It uses the [pthreads ↗](https://en.wikipedia.org/wiki/POSIX_Threads) library to spawn multiple threads that each compress a chunk of the input file(s) concurrently, which can significantly speed up the compression process.

This project is part of the [Operating Systems: Three Easy Pieces ↗](http://pages.cs.wisc.edu/~remzi/OSTEP/) book, which provides an introduction to operating systems concepts and implementation. Concurrency PZip is a solution to one of the book's exercises, and it's intended to showcase the use of threads for parallelism.

## Usage

To use Concurrency PZip, you need to compile the source code first. You can do this using the provided Makefile by running the following command:

```
make
```

This will generate an executable file named `wzip`. You can then use this file to compress one or more input files. For example:

```
./wzip file1.txt file2.txt file3.txt
```

This will compress the three files in parallel, and the output will be written to the standard output. You can redirect the output to a file using the `>` operator, like this:

```
./wzip file1.txt file2.txt file3.txt > output.zip
```

This will compress the files and write the output to the `output.zip` file.

## Testing

To test this project using the test cases provided by the class instructor:

```
make test
```
