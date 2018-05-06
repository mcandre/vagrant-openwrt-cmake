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

add_custom_target(cppcheck COMMAND cppcheck -q --enable=all --suppressions-list=suppressions.cfg lib)
add_custom_target(splint COMMAND splint lib/main.c lib/fewer.c lib/fewer.h)
add_custom_target(vera++ COMMAND vera++ -s lib/main.c lib/fewer.c lib/fewer.h)

add_custom_target(poormansdebug COMMAND echo ${CMAKE_GNU_C_MACHINE})

if (${CMAKE_SYSTEM_NAME} MATCHES "SmartOS")
  add_custom_target(lint)
elseif (CMAKE_GNU_C_MACHINE)
  if (${CMAKE_GNU_C_MACHINE} MATCHES "uclibc")
    add_custom_target(lint)
  endif()
elseif (${CMAKE_SYSTEM_NAME} MATCHES "Haiku")
  add_custom_target(lint DEPENDS cppcheck)
elseif (${CMAKE_SYSTEM_NAME} MATCHES "Minix")
  add_custom_target(lint DEPENDS splint)
elseif(MSVC OR ${CMAKE_SYSTEM_NAME} MATCHES "Void" OR ${CMAKE_SYSTEM_NAME} MATCHES "OpenBSD")
  add_custom_target(lint DEPENDS cppcheck splint)
else()
  add_custom_target(lint DEPENDS cppcheck splint vera++)
endif()
