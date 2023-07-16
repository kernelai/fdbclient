cmake_minimum_required(VERSION 3.0.0)
project(demo VERSION 0.1.0 LANGUAGES C CXX)

include(CTest)
enable_testing()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
find_package(FDBClient MODULE REQUIRED)

# for debug
# include(CMakePrintHelpers)
# cmake_print_properties(
#      TARGETS
#        fdb_c
#      PROPERTIES
#        LOCATION
#        INTERFACE_COMPILE_OPTIONS
#        INTERFACE_INCLUDE_DIRECTORIES
#        INTERFACE_LINK_LIBRARIES
# )

add_executable(${PROJECT_NAME} main.cpp)
target_include_directories(${PROJECT_NAME} 
  PRIVATE
    ${FDBClient_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME}
  PRIVATE
    ${FDBClient_LIBRARIES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
