# Introduction
This repository holds the testing code as well as scripts necessary for fuzz testing the [HPX C++ Parallelism Library](https://hpx.stellar-group.org) with [AFL++](https://github.com/AFLplusplus/AFLplusplus) on LSU's rostam cluster.

# Writing Additional Tests
Currently, this repository only contains code for testing the HPX ForEach algorithm. Additional tests can be written by modifying code from the HPX unit tests (found [here](https://github.com/STEllAR-GROUP/hpx/blob/master/libs/core/algorithms/tests/unit/algorithms) to use stdin, which works with AFL++, and including the code in this repo as well as the necessary build commands in CMakeLists.txt.

# Running on Rostam

