#include "types.h"
#include "user.h"
#include "pstat.h"

void process(void) {

  while (1) {

  }
  exit();
}

struct pstat p = {0} ;


int main(void) {
  int i;

int x = getpinfo(&p);
  if (x < 0)
  {
    exit();
  }
  // Create three child processes with different numbers of tickets
  int pid_A = fork();
  if (pid_A == 0) {
    settickets(30);
    process();
  }

  int pid_B = fork();
  if (pid_B == 0) {
    settickets(20);
    process();
  }

  int pid_C = fork();
  if (pid_C == 0) {
    settickets(10);
    process();
  }

  // Wait for the child processes to exit
  for (i = 0; i < 3; i++) {
    wait();
  }

  exit();
}
