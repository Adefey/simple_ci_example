cmake_minimum_required(VERSION 3.24)

project(simple_ci)

set(SOURCE_FILES
        ./src/lib_server.cpp
   )

set(INCLUDE_DIR
        ./include
   )

add_library(server STATIC ${SOURCE_FILES})

set(CXX_PROPERTIES
        CXX_STANDARD 20
   )

target_include_directories(server PUBLIC ${INCLUDE_DIR})

set_target_properties(server PROPERTIES ${CXX_PROPERTIES})
