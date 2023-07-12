#include "types.h"
#include "user.h"
#include "pstat.h"


int
main (void)
{
  struct pstat p ;
  if (getpinfo(&p) < 0) {
    exit();
  }
  for (int i = 0 ; i < NPROC ; i++) {
    if (p.inuse[i] == 1) 
    {
       printf(1,"pid : %d \n",p.pid[i]);
       printf(1,"tickets : %d \n",p.tickets[i]);
       printf(1,"ticks : %d \n",p.ticks[i]);
       printf(1, "----------------------\n");
    }
  }
  exit();
}
