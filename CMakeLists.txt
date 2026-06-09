cmake_minimum_required(VERSION 3.10)
project(MyCppApp)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the main executable
add_executable(my_app src/main.cpp)

# Find and add Google Test
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

# Add the test executable
add_executable(run_tests tests/test_main.cpp)
target_link_libraries(run_tests ${GTEST_LIBRARIES} pthread)