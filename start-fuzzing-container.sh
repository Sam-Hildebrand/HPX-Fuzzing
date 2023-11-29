#!/bin/bash

# Author: Sam Hildebrand (samuelchildebrand@gmail.com)

# WARNING: "--force" will overwrite the file "HPX-Fuzzer.sif" in the 
# working directory. If you want to save an instance file from a run,
# just rename it.
singularity build --force HPX-Fuzzer.sif HPX-Fuzzer.def

# Kill the previous Fuzzing Container
singularity instance stop Fuzzer1

# Run the instance. Start fuzzing
singularity instance run --writable-tmpfs HPX-Fuzzer.sif Fuzzer1
