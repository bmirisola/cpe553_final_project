# Set the minimum version of cmake required to build this project
cmake_minimum_required(VERSION 3.17)

# Set the name and the supported language of the project
project(cpe553_final_project CUDA)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CUDA_STANDARD 14)

# Use the package PkgConfig to detect GTK+ headers/library files
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

# Setup CMake to use GTK+, tell the compiler where to look for headers
# and to the linker where to look for libraries
include_directories(${GTK3_INCLUDE_DIRS})
link_directories(${GTK3_LIBRARY_DIRS})

# Add other flags to the compiler
add_definitions(${GTK_CFLAGS_OTHER})

# Add an executable compiled from files:
add_executable(cpe553_final_project main.cu test/window_manager.h test/window_manager.cu WindowManager.cu WindowManager.cuh)

target_link_libraries(cpe553_final_project ${GTK3_LIBRARIES})

# Idk what this does or if it's necessary, but it works with it and was there on creation
# So I'm keeping it :)
set_target_properties(cpe553_final_project PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)
