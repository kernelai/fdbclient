# Find FoundationDB client Headers/Libs

# Variables
# FDBClient_ROOT - set this to a location where FoundationDB client may be found
#
# FDBClient_FOUND - True of FoundationDB client found
# FDBClient_INCLUDE_DIRS - Location of FoundationDB client includes
# FDBClient_LIBRARIES - FoundationDB client libraries

if(NOT FDBClient_ROOT)
  set(FDBClient_ROOT "$ENV{FDBClient_ROOT}")
endif()

if(NOT FDBClient_ROOT)
  find_path(_FDBClient_ROOT NAMES foundationdb/fdb_c.h PATH_SUFFIXES include)
else()
  set(_FDBClient_ROOT "${FDBClient_ROOT}")
endif()
message(STATUS "FDBClient_ROOT: ${_FDBClient_ROOT}")

find_path(FDBClient_INCLUDE_DIRS NAMES foundationdb/fdb_c.h HINTS ${_FDBClient_ROOT})
message(STATUS "FDBClient_INCLUDE_DIRS: ${FDBClient_INCLUDE_DIRS}")

if(FDBClient_INCLUDE_DIRS)
# TODO: find version from fdb_c.h and check it
  find_library(FDBClient_LIBRARIES
      NAMES
        libfdb_c.so
      HINTS
        ${_FDBClient_ROOT}/lib
      )
endif()

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(FDBClient
  FOUND_VAR
    FDBClient_FOUND
  REQUIRED_VARS
    FDBClient_INCLUDE_DIRS
    FDBClient_LIBRARIES
  )