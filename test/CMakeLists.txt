cmake_minimum_required(VERSION 3.24)

project(simple_ci)

find_package(GTest REQUIRED)

set(SOURCE_FILES
        ./main.cpp
        ../src/lib_server.cpp
   )

set(INCLUDE_DIR
        ../include
   )

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -lpthread -lgtest -lgcov -fPIC")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -lgtest -lpthread -lgcov -fPIC")

add_executable(Test ${SOURCE_FILES})

set_source_files_properties(SOURCE ../src/lib_server.cpp APPEND PROPERTY COMPILE_DEFINITIONS -coverage)

target_include_directories(Test PUBLIC ${INCLUDE_DIR} ${GTEST_INCLUDE_DIRS})

target_link_directories(Test PUBLIC .)

target_link_libraries(Test PUBLIC ${GTEST_LIBRARIES})




