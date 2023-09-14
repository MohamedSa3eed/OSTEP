#include "user.h"

#define NULL (void *)0

int count = 0;
lock_t lock ;

void add(void *arg1 , void *arg2)
{
  int i;
  for(i = 0; i < 1000; i++)
  {
    lock_acquire(&lock);
    count++;
    lock_release(&lock);
  }
  exit();
}

int main(int argc, char *argv[])
{
  lock_init(&lock);
  int t1 = thread_create(add, NULL, NULL);
  printf(1, "Thread %d created\n", t1);
  int t2 = thread_create(add, NULL, NULL);
  printf(1, "Thread %d created\n", t2);
  int t3 = thread_create(add, NULL, NULL);
  printf(1, "Thread %d created\n", t3);
  int t4 = thread_create(add, NULL, NULL);
  printf(1, "Thread %d created\n", t4);
  int t5 = thread_create(add, NULL, NULL);
  printf(1, "Thread %d created\n", t5);
  int b1 = thread_join();
  printf(1, "Thread %d joined\n", b1);
  int b2 = thread_join();
  printf(1, "Thread %d joined\n", b2);
  int b3 = thread_join();
  printf(1, "Thread %d joined\n", b3);
  int b4 = thread_join();
  printf(1, "Thread %d joined\n", b4);
  int b5 = thread_join();
  printf(1, "Thread %d joined\n", b5);
  printf(1, "count = %d\n", count);
  exit();
}
