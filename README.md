# Introduction
This repository holds the testing code as well as scripts necessary for fuzz testing the [HPX C++ Parallelism Library](https://hpx.stellar-group.org) with [AFL++](https://github.com/AFLplusplus/AFLplusplus) on LSU's rostam cluster.

# Writing Additional Tests
Currently, this repository only contains code for testing the HPX ForEach algorithm. Additional tests can be written by modifying code from the HPX unit tests (found [here](https://github.com/STEllAR-GROUP/hpx/blob/master/libs/core/algorithms/tests/unit/algorithms)) to use stdin, which works with AFL++, and including the code in this repo as well as the necessary build commands in CMakeLists.txt.

# Running on Rostam
The container is built using the `HPX-Fuzzer.def` file. You can build a singularity (apptainer) image (.sif file) by running `singularity build HPX-Fuzzer.sif HPX-Fuzzer.def`. Note that this command takes quite a while to run since it builds HPX and its dependencies from source, and produces a **lot** of output, so it may be advisable to redirect output to a file, e.g. `singularity build HPX-Fuzzer.sif HPX-Fuzzer.def >> Fuzzing-Setup.log`. Once the container is built, you can run `singularity instance run --writable-tmpfs HPX-Fuzzer.sif Fuzzer1`, where `Fuzzer1` is just the name for the running container in singularity, to run the container and start the fuzzing program. `singularity instance stop Fuzzer1` to kill the running container. The `start-fuzzing-container.sh` script just combines the build and run operations into a bash script. Just run `./start-fuzzing` to build and run the container (and subsequently run the HPX fuzzing tests).

It's also of note that all of the singularity commands work with SLURM, and the `.sif` file is written back to your working directory, so you could easily build the container image on one partition: `srun -p [build partition] singularity build HPX-Fuzzer.sif HPX-Fuzzer.def`, then run the fuzz test on a different partition: `srun -p [fuzzing partition] singularity instance run --writable-tmpfs HPX-Fuzzer.sif Fuzzer1`.

# Time Comparison of Build and Run Operations
As mentioned earlier, building the container can take a significant amount of time. The outputs of `time singularity build ...` running on the Rostam home sever is included below:

#### `time singularity build ...`:
```
...
real	65m2.450s
user	84m26.537s
sys	7m13.720s
```
