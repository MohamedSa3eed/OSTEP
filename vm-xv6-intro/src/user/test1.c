#include "user.h"

int main(int argc, char *argv[]) {
  char *addr = malloc(4096);
  if (addr == 0) {
    printf(1, "Error: malloc failed\n");
    exit();
  }
  printf(1, "Allocated page at address %p\n", addr);
  if (mprotect(addr, 1) < 0) {
    printf(1, "Error: mprotect failed\n");
    exit();
  }
  printf(1, "if a trap err occurred ----> mprotect test passed\n");
  addr[0] = 'A'; // Should trigger a page fault
  if (munprotect(addr, 1)<0) {
    printf(1, "Error munprotect failed\n");
  }
  addr[0]='A';
  printf(1, "munprotect test passed\n");
  exit();
}
