#include <iostream>

#define FDB_API_VERSION 710
#include <foundationdb/fdb_c.h>

int main() {
  std::cout << "hello,world!" << std::endl;
  fdb_select_api_version(FDB_API_VERSION);
}