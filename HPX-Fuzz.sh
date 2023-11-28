#!/bin/bash

/AFLplusplus/afl-fuzz -i /Fuzzing/HPX-Fuzzing/inputs -o Fuzzing-Output -- /Fuzzing/HPX-Fuzzing/build/foreach_fuzzer