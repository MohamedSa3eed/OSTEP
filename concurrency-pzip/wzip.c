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

#define MAX_FILES 100         // max number of files to compress
#define MAX_CHUNKS 600        // max number of chunks to compress
#define MIN_CHUNCK_SIZE 1024  // min size for a chunck only if the file has a bigger size 

typedef struct {
  unsigned int id;                // store the chunk id 
  int size;              // store the chunk size 
  int start;             // store the file index of the first char in chunk 
  int last_chunk ;       // 1 indicates that chunck is the last one 
  char *encoded_chunk ;  // the encoded chunk in memory 
  char * cursor ;        // used to write data to the encoded_chunk buffer
} chunk;

struct {
  int size ;                     // holds the file size 
  int file_cursor;               // holds the current index of file 
  unsigned int chunk_id_setter;  // sets the chunks id 
  char *file_in_memory ;         // the file in memory 
}file;

unsigned int print_order = 0 ;    // holds the id of next chunk to print 
int consumed_all = 0 ;   // 1 indicates that all chunks has been consumed 

pthread_mutex_t file_lock = PTHREAD_MUTEX_INITIALIZER ;     // lock for the file 
pthread_mutex_t chunks_lock = PTHREAD_MUTEX_INITIALIZER ;   // lock for the chunks queue 
pthread_mutex_t print_lock = PTHREAD_MUTEX_INITIALIZER ;    // lock for the print order
pthread_cond_t fill_chunks_cv = PTHREAD_COND_INITIALIZER ;  // to wake the consumer threads to dequeue 
pthread_cond_t empty_chunks_cv = PTHREAD_COND_INITIALIZER ; // to wake the producer thread to enqueue
pthread_cond_t print_cv = PTHREAD_COND_INITIALIZER ;        // to wake the consumer thread to print 
//variables for producer/consumer 
chunk *chunks[MAX_CHUNKS] ;
int fill = 0 ;
int use = 0 ;
int count = 0 ;

void print_err(char *err); // takes the error as string and prints the error message 
 /*takes the number of files and array of files names
 and return the file size and pointer to it in memory*/
void map_files(int num_files , char *filenames[] , int *new_n , char **file);  
void enqueue(chunk *c);  // takes pointer to chunk as argument and fill the queue with it
chunk *dequeue(void);    // extracts a chunk from the queue 
void *producer(void *arg); // for the producer thread
void *consumer(int *id); // for the consumer thread 
void encode_chunk(chunk *c); // encodes and process the chunk
void open_file_for_encoded_chunk (chunk *c); // opens file to store the encoded chunk
void print_encoded_chunk(chunk *c);  // prints the encoded chunk

int main(int argc, char *argv[])
{
  if (argc < 2) { //check that the program is executed correctly 
    print_err("wzip: file1 [file2 ...]\n");
    exit(EXIT_FAILURE);
  }
  file.size = 0 ;
  file.file_cursor = 0 ;
  file.chunk_id_setter = 0 ;
  //map all input files into one file 
  map_files(argc , argv , &file.size , &file.file_in_memory) ;
  int threads = get_nprocs(); // get the number of threads 
   /*creating threads */
  pthread_t producer_t ;
  pthread_t consumer_t[threads];
  int rc = pthread_create(&producer_t, NULL,producer, NULL);
  assert(rc == 0);
  int arr[threads];
  for (int i = 0; i<threads; i++) {
    arr[i] = i ;
   int rc = pthread_create(&consumer_t[i], NULL, (void *)(void *)consumer , (void *)&arr[i]);
    assert(rc == 0);
  }
  /*waitting for the threads*/
  pthread_join(producer_t, NULL);
  for (int i = 0; i<threads; i++) {
    pthread_join(consumer_t[i], NULL);
  }
  // free the memory of the file
  free(file.file_in_memory);
  file.file_in_memory = NULL ;
  return EXIT_SUCCESS;
}

void print_err(char *err)
{
  fprintf(stdout,"%s",err);
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
  while (file.file_cursor < file.size) { // looping the whole file 
    chunk *c = (chunk *)malloc(sizeof(chunk)); // allocate memory for the chunk
    c->id = file.chunk_id_setter ; // set the id for the chunk
    if (file.size <= MIN_CHUNCK_SIZE) // if the file is too small 
    {
      c->start = 0 ; //make the chunk start the same as file start
      file.file_cursor = file.size ; //update the file cursor
      c->size = file.size ; // set the chunk size the same as file
    }
    else
    {
      c->start = file.file_cursor ; // make the chunk start from the last cursor position 
      if((file.file_cursor + MIN_CHUNCK_SIZE) <= file.size ) // check if there is enough size for a chunk
        file.file_cursor += (MIN_CHUNCK_SIZE  ) ; // set the min size of chunk initially 
      else 
        file.file_cursor = file.size ; // get the rest of the file 
      int local_flag = 0 ;
      while( file.file_cursor < file.size && file.file_in_memory[file.file_cursor] == file.file_in_memory[file.file_cursor + 1]) // make sure every chunk ends with all instances of the char 
      {
        local_flag = 1;
        file.file_cursor ++ ; //update the file cursor
      }
      if (local_flag) {
        file.file_cursor ++ ;
        local_flag = 0;
      }
      c->size = file.file_cursor - c->start ; // update the chunk size 
    }
    file.chunk_id_setter ++;  //update the id setter 
    if (file.file_cursor == file.size) // check if it is the last chunk
      c->last_chunk = 1 ;
    else
      c->last_chunk = 0 ;
    pthread_mutex_lock(&chunks_lock);
    while (count == MAX_CHUNKS) { // the queue is full 
      pthread_cond_wait(&empty_chunks_cv, &chunks_lock); // make the thread sleep 
    }
    enqueue(c);
    pthread_cond_signal(&fill_chunks_cv); // wake a consumer thread
    pthread_mutex_unlock(&chunks_lock);
  }
  return NULL;
}
void *consumer(int *id)
{
  while (1) {
    pthread_mutex_lock(&chunks_lock);
    while (count == 0) { //the queue is empty 
      if(consumed_all) //check if all chunks are consumed 
        break;
      pthread_cond_wait(&fill_chunks_cv, &chunks_lock);  // put the thread to sleep 
    }
    if(consumed_all)//check if all chunks are consumed 
    {
       pthread_mutex_unlock(&chunks_lock);
       break;
    }
    chunk *c = dequeue(); 
    if(c->last_chunk) // check if the chunk is the last one 
    {
      consumed_all = 1 ;
    }
    pthread_cond_signal(&empty_chunks_cv); //wake a producer thread 
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
      if (cursor == (c->size -1) ) {
        // Write data to the memory buffer 
        memcpy(c->cursor, &counter, sizeof(int)); // Write binary data to the buffer
        c->cursor += sizeof(int);
        memcpy(c->cursor, &file.file_in_memory[offset], sizeof(char)); // Write binary data to the buffer
        c->cursor += sizeof(char);
        counter = 1 ;
      }
    }
    else {
      if (counter == 1 && *(file.file_in_memory+offset) == *(file.file_in_memory+offset - 1)) {
        cursor ++;
        continue; 
      }
      // Write data to the memory buffer 
      memcpy(c->cursor, &counter, sizeof(int)); // Write binary data to the buffer
      c->cursor += sizeof(int);
      memcpy(c->cursor, &file.file_in_memory[offset], sizeof(char)); // Write binary data to the buffer
      c->cursor += sizeof(char);
      counter = 1 ;
    }
    cursor++ ;
  }
  //Print chunk in its order 
  print_encoded_chunk(c);
  // Free the memory
  free(c->encoded_chunk);
  c->encoded_chunk = NULL ;
  c->cursor = NULL ;
  free(c);
  c = NULL ;
}
void open_file_for_encoded_chunk (chunk *c)
{ 
  size_t s = (size_t)((sizeof(int)+sizeof(char))*(c->size)); // assume the max size of the chunk 
  // Allocate chunk_size bytes of memory
  c->encoded_chunk = (char *)malloc(s);
  if (c->encoded_chunk == NULL) {
      exit(EXIT_FAILURE);
  }
  c->cursor = c->encoded_chunk ;
}
void print_encoded_chunk(chunk *c)
{
  pthread_mutex_lock(&print_lock);
  while(print_order != c->id) // check for the chunk order 
  {
    pthread_cond_wait(&print_cv , &print_lock); // go to sleep 
  }
  // Redirect the contents of the buffer to stdout
  write(STDOUT_FILENO, c->encoded_chunk, c->cursor - c->encoded_chunk);
  print_order++; // update the order 
    pthread_cond_broadcast(&print_cv); // wake all threads to check 
  pthread_mutex_unlock(&print_lock);
}
