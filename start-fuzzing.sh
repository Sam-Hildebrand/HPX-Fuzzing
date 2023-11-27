#!/bin/bash

# Author: Sam Hildebrand (samuelchildebrand@gmail.com)

# WARNING: "--force" will overwrite the file "HPX-Fuzzer.sif" in the 
# working directory. If you want to save an instance file from a run,
# just rename it.
singularity build --force HPX-Fuzzer.sif HPX-Fuzzer.def >> Fuzzing-Setup.log
singularity instance run --writable-tmpfs HPX-Fuzzer.sif Fuzzer1
singularity shell instance://Fuzzer1
singularity instance stop Fuzzer1
