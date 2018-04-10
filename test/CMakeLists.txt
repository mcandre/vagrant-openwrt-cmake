cmake_minimum_required(VERSION 3.4)

project(hello)
set(EXECUTABLE_OUTPUT_PATH "bin")
set(CMAKE_C_FLAGS "-O2 -Wall -Wextra -pedantic -std=c99")
if (CMAKE_C_COMPILER_ID MATCHES "Clang")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wmost -Weverything")
endif()
add_executable(hello lib/hello.c)

enable_testing()
add_test(NAME hellotest COMMAND hello)
