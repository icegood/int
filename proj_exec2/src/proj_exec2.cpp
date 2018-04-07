#include "proj_lib.h"
#include "proj_exec2.h"
#include <iostream>

static void print_status()
{
#ifdef common_def
  std::cout << "common_def is defined" << std::endl;
#else
  std::cout << "common_def is not defined" << std::endl;
#endif

#ifdef proj_exec2_specific
  std::cout << "proj_exec2_specific is defined" << std::endl;
#else
  std::cout << "proj_exec2_specific is not defined" << std::endl;
#endif
}

int main () {
  print_status();
  LibDoSomething();
  return 0;
}