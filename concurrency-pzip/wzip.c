#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <unistd.h>
#include "sys/mman.h"
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/sysinfo.h>
#include "pthread.h"

#define MAX_FILES 100 // max number of files to compress

void print_err(char *err);
void map_files(int num_files , char *filenames[] , int *new_n , char **file);

int main(int argc, char *argv[])
{
  if (argc < 2) {
    print_err("wzip: file1 [file2 ...]\n");
    exit(EXIT_FAILURE);
  }
  int file_size = 0 ;
  char *file = NULL ;
  map_files(argc , argv , &file_size , &file) ;
  int threads = get_nprocs();

  free(file);
  return EXIT_SUCCESS;
}

void print_err(char *err)
{
  fprintf(stderr,"%s",err);
}
void map_files(int num_files , char *filenames[] , int *new_n , char **file)
{
  int fds[MAX_FILES];
  struct stat sb[MAX_FILES];
  off_t file_sizes[MAX_FILES];
  char *file_data[MAX_FILES];
  size_t total_size = 0;
  // Open all the files and obtain their sizes
  for (int i = 1; i < num_files; i++) {
      fds[i] = open(filenames[i], O_RDONLY);
      if (fds[i] == -1) {
          print_err("wzip: cannot open file\n") ;
          exit(EXIT_FAILURE);
      }
      if (fstat(fds[i], &sb[i]) == -1) {
          print_err("wzip: cannot get file status\n") ;
          exit(EXIT_FAILURE);
      }
      file_sizes[i] = sb[i].st_size;
      total_size += file_sizes[i];
  }
  // Map each file to memory
  off_t offset = 0;
  for (int i = 1; i < num_files; i++) {
      file_data[i] = mmap(NULL, file_sizes[i], PROT_READ, MAP_SHARED, fds[i], 0);
      if (file_data[i] == MAP_FAILED) {
          print_err("wzip: cannot map file\n") ;
          exit(EXIT_FAILURE);
      }
      offset += file_sizes[i];
  }
  // Concatenate the mapped regions into a single block of memory
  char *concatenated_data = malloc(total_size);
  offset = 0;
  for (int i = 1; i < num_files; i++) {
      memcpy(concatenated_data + offset, file_data[i], file_sizes[i]);
      offset += file_sizes[i];
  }
  // Unmap the memory and close the files
  for (int i = 1; i < num_files; i++) {
      if (munmap(file_data[i], file_sizes[i]) == -1) {
          print_err("wzip: cannot unmap file\n");
          exit(EXIT_FAILURE);
      }
      close(fds[i]);
  }
  // update the argunemnts 
  *file = concatenated_data ;
  *new_n = (int)total_size ; 
}
