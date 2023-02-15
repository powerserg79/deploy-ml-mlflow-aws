#!/bin/bash

# store $(basename $PWD) in a variable
env=$(basename $PWD)
source $(conda info --root)/etc/profile.d/conda.sh

conda deactivate
conda remove -n $env --all