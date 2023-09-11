#ifndef XV6_USER_H
#define XV6_USER_H

#include "kernel/date.h"
#include "kernel/fcntl.h"
#include "kernel/fs.h"
#include "kernel/stat.h"
#include "kernel/types.h"
#include "kernel/x86.h"

typedef struct lock_t { 
  int ticket;
  int turn;
} lock_t;

// system calls
int fork(void);
int exit(void) __attribute__((noreturn));
int wait(void);
int pipe(int*);
int write(int, void*, int);
int read(int, void*, int);
int close(int);
int kill(int);
int exec(char*, char**);
int open(char*, int);
int mknod(char*, short, short);
int unlink(char*);
int fstat(int fd, struct stat*);
int link(char*, char*);
int mkdir(char*);
int chdir(char*);
int dup(int);
int getpid(void);
char* sbrk(int);
int sleep(int);
int uptime(void);
int clone(void(*fcn)(void *, void *), void *arg1, void *arg2, void *stack);
int join(void** stack);

// ulib.c
int stat(char*, struct stat*);
char* strcpy(char*, char*);
void* memmove(void*, void*, int);
char* strchr(const char*, char c);
int strcmp(const char*, const char*);
void printf(int, char*, ...);
char* gets(char*, int max);
uint strlen(char*);
void* memset(void*, int, uint);
void* malloc(uint);
void free(void*);
void* realloc(void*, uint);
int atoi(const char*);
void lock_init(lock_t*);
void lock_acquire(lock_t*);
void lock_release(lock_t*);
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2);
int thread_join(void);

#endif // XV6_USER_H
