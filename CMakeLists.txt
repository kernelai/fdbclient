cmake_minimum_required(VERSION 3.0.0)
project(demo VERSION 0.1.0 LANGUAGES C CXX)

include(CTest)
enable_testing()

find_package(FoundationDB-Client CONFIG REQUIRED)
include(CMakePrintHelpers)
cmake_print_properties(
     TARGETS
       fdb_c
     PROPERTIES
       LOCATION
       INTERFACE_COMPILE_OPTIONS
       INTERFACE_INCLUDE_DIRECTORIES
       INTERFACE_LINK_LIBRARIES
)
# for debug
message(STATUS "FoundationDB-Client_FOUND: ${FoundationDB-Client_FOUND}")
message(STATUS "FoundationDB-Client_INCLUDE_DIRS: ${FoundationDB-Client_INCLUDE_DIRS}")
message(STATUS "FoundationDB-Client_LIBRARIES: ${FoundationDB-Client_LIBRARIES}")
message(STATUS "FoundationDB-Client_VERSION: ${FoundationDB-Client_VERSION}")

add_executable(${PROJECT_NAME} main.cpp fdb_c)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
