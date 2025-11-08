cmake_minimum_required(VERSION 3.28)
project(raylib_template LANGUAGES C)

include_directories(include)
add_executable(main src/main.c)
target_compile_features(main PRIVATE c_std_11)
