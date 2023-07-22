#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include <stddef.h>
#include <unistd.h>
#include "sys/mman.h"
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/sysinfo.h>
#include "pthread.h"
#include <assert.h>

#define MAX_FILES 100 // max number of files to compress
#define MAX_CHUNKS 100 // max number of chunks to compress
#define MIN_CHUNCK_SIZE 1024 // min size for a chunck only if the file has a bigger size 

typedef struct {
  int id;
  int size;
  int start;
  int last_chunk ;
  int encoded_fd ;
  FILE *encoded_fp ;
  char *encoded_chunk ;
} chunk;

struct {
  int size ; 
  int file_cursor;
  int chunck_id_setter;
  char *file_in_memory ; 
}file;

int print_order = 0 ;
int consumed_all = 0 ;

pthread_mutex_t file_lock = PTHREAD_MUTEX_INITIALIZER ;
pthread_mutex_t chunks_lock = PTHREAD_MUTEX_INITIALIZER ;
pthread_mutex_t print_lock = PTHREAD_MUTEX_INITIALIZER ;
pthread_cond_t fill_chunks_cv = PTHREAD_COND_INITIALIZER ;
pthread_cond_t empty_chunks_cv = PTHREAD_COND_INITIALIZER ;
pthread_cond_t print_cv = PTHREAD_COND_INITIALIZER ;
chunk *chunks[MAX_CHUNKS] ;
int fill = 0 ;
int use = 0 ;
int count = 0 ;

void print_err(char *err);
void map_files(int num_files , char *filenames[] , int *new_n , char **file);
void enqueue(chunk *c);
chunk *dequeue(void);
void *producer(void *arg);
void *consumer(void *arg);
void encode_chunk(chunk *c);
void open_file_for_encoded_chunk (chunk *c);
void print_encoded_chunk(chunk *c);

int main(int argc, char *argv[])
{
  if (argc < 2) {
    print_err("wzip: file1 [file2 ...]\n");
    exit(EXIT_FAILURE);
  }
  file.size = 0 ;
  map_files(argc , argv , &file.size , &file.file_in_memory) ;
  int threads = get_nprocs();
  pthread_t producer_t ;
  pthread_t consumer_t[threads];
  int rc = pthread_create(&producer_t, NULL,producer, NULL);
  assert(rc == 0);
  for (int i = 0; i<threads; i++) {
   int rc = pthread_create(&consumer_t[i], NULL, consumer , NULL);
    assert(rc == 0);
  }
  pthread_join(producer_t, NULL);
  for (int i = 0; i<threads; i++) {
    pthread_join(consumer_t[i], NULL);
  }
  free(file.file_in_memory);
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
      file_data[i] = mmap(NULL, file_sizes[i], PROT_READ, MAP_PRIVATE, fds[i], 0);
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
void enqueue(chunk *c)
{
  chunks[fill] = c ;
  fill = (fill + 1) % MAX_CHUNKS ;
  count++ ;
}
chunk *dequeue(void)
{
  chunk *c = chunks[use];
  use = (use + 1) % MAX_CHUNKS ;
  count-- ;
  return c;
}
void *producer (void *arg)
{
  chunk *c = (chunk *)malloc(sizeof(chunk));
  while (file.file_cursor < file.size) {
    pthread_mutex_lock(&file_lock);
    c->id = file.chunck_id_setter ;
    if (file.size <= MIN_CHUNCK_SIZE)
    {
      c->start = 0 ;
      c->size = file.size ;
      file.file_cursor = file.size ;
    }
    else
    {
      c->start = file.file_cursor;
      file.file_cursor += MIN_CHUNCK_SIZE ;
      while(file.file_in_memory[file.file_cursor] == file.file_in_memory[file.file_cursor + 1]) 
      {
        file.file_cursor ++ ;
      }
      c->size = file.file_cursor - c->start ;
    }
    if (file.file_cursor == file.size)
      c->last_chunk = 1 ;
    pthread_mutex_unlock(&file_lock);
    pthread_mutex_lock(&chunks_lock);
    while (count == MAX_CHUNKS) {
      pthread_cond_wait(&empty_chunks_cv, &chunks_lock);
    }
    enqueue(c);
    pthread_cond_signal(&fill_chunks_cv);
    pthread_mutex_unlock(&chunks_lock);
  }
  return NULL;
}
void *consumer(void *arg)
{
  while (1) {
    pthread_mutex_lock(&chunks_lock);
    while (count == 0) {
      pthread_cond_wait(&fill_chunks_cv, &chunks_lock); 
      if(consumed_all) //check if all chunks are consumed 
        break;
    }
    if(consumed_all)//check if all chunks are consumed 
      break;
    chunk *c = dequeue(); 
    if(c->last_chunk) // check if the chunk is the last one 
    {
      consumed_all = 1 ;
    }
    pthread_cond_signal(&empty_chunks_cv);
    pthread_mutex_unlock(&chunks_lock);
    encode_chunk(c);
  }
  pthread_cond_broadcast(&fill_chunks_cv); //wake all consumer threads to terminate
  return NULL;
}
void encode_chunk (chunk *c)
{
  open_file_for_encoded_chunk (c);
  int counter = 1 ;
  int cursor  = 0 ;
  while (cursor < c->size) {
    int offset = (c->start)+cursor ;
    if (file.file_in_memory[offset] == file.file_in_memory[offset+1]) {
      counter++;
    }
    else {
      // Write data to the memory buffer 
      fwrite(&counter ,sizeof(int),1,c->encoded_fp);
      fwrite(&file.file_in_memory[offset],sizeof(char),1,c->encoded_fp);
      counter = 1 ;
    }
    cursor++ ;
  }
  //Print chunck in its order 
  print_encoded_chunk(c);
  // Close the file descriptor
  close(c->encoded_fd);
  // Free the memory
  /*free(c->encoded_chunk);*/
  free(c->encoded_fp) ;
  free(c);
}
void open_file_for_encoded_chunk (chunk *c)
{ 
  size_t s = (size_t)(sizeof(int)+sizeof(char)*(c->size));
  // Allocate chunk_size bytes of memory
  c->encoded_chunk = (char *)malloc(s);
  if (c->encoded_chunk == NULL) {
      exit(EXIT_FAILURE);
  }
  // Open a file for the memory buffer
  FILE *fp = fmemopen(&c->encoded_chunk , s , "w+") ;
  if (fp == NULL) {
      free(c->encoded_chunk);
      exit(EXIT_FAILURE);
  }
  c->encoded_fp = fp ;
  int fd = fileno(fp); 
  c->encoded_fd = fd ;
}
void print_encoded_chunk(chunk *c)
{
  pthread_mutex_lock(&print_lock);
  while(print_order != c->id)
  {
    pthread_cond_broadcast(&print_cv);
    pthread_cond_wait(&print_cv , &print_lock);
  }
  // Redirect the contents of the buffer to stdout
  write(STDOUT_FILENO, c->encoded_chunk, strlen(c->encoded_chunk));
  print_order++;
  pthread_mutex_unlock(&print_lock);
}
