#!/bin/bash

# This file contains the command to be run in order to start fuzzing HPX

/AFLplusplus/afl-fuzz -i /Fuzzing/HPX-Fuzzing/inputs -o Fuzzing-Output -- /Fuzzing/HPX-Fuzzing/build/foreach_fuzzer >> HPX-Fuzzing.log