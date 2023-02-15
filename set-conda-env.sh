#!/bin/bash

# store $(basename $PWD) in a variable
env="cenv_$(basename $PWD)"
python_version="3.10"

exists=$(conda env list | grep $env)

echo "Conda environment $env exists: $exists"

source $(conda info --root)/etc/profile.d/conda.sh

env_file="./environment.yml"
#  if environment.yml exists and environment doesn't, create environment from environment.yml
if [ -e $env_file ] && [ -z "$exists" ]; then
    echo "Installing environment.yml"
    conda env create -f $env_file

elif [ -z "$exists" ]; then
    echo "Creating new conda environment $env"
    conda create -n $env python=$python_version -y

fi
