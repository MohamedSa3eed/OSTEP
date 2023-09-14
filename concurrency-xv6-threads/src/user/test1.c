#include "kernel/types.h"
#include "user/user.h"

#define NULL (void *)(0)

void hello(void *arg1, void *arg2)
{
  printf(1, "test1: starting a child thread with pid %d\n", getpid());
  printf(1, "test1: hello world\n");
  exit();
}
void echo(void *argc, void *string)
{
  printf(1, "test1: starting a child thread with pid %d\n", getpid());
  for (int i = *(int *)argc; i>0 ; i--) {
    printf(1,"%s\n", (char *)string);
  }
  exit();
}

int main(int argc, char *argv[])
{
  printf(1, "test1: starting with pid %d\n", getpid());
  int i = 3;
  char *str = "hello";
  int x = thread_create(echo, (void *)&i, (void *)str);
  printf(1, "test1: created a child thread with pid %d\n", x);
  int z = thread_create(hello, NULL, NULL);
  printf(1, "test1: created a child thread with pid %d\n", z);
  int y = thread_join();
  printf(1, "test1: joined a child thread with pid %d\n", y);
  int w = thread_join();
  printf(1, "test1: joined a child thread with pid %d\n", w);
  exit();
}
