#!/bin/bash

# Specify the folder path
folder_path="PythonAPI"

# Check if the folder exists
if [ -d "$folder_path" ]; then
  echo "Folder $folder_path exists. Deleting..."
  # Delete the folder and its contents
  rm -rf "$folder_path"
fi

# Create carla folder
mkdir PythonAPI
cd PythonAPI


# Set python alias
alias python=python3.7

# Run Docker container and copy files
container_id=$(docker run --name carla_container --rm -d carlasim/carla:latest)
container_status=$(docker inspect -f '{{.State.Status}}' $container_id)

if [ "$container_status" == "running" ]; then
  docker cp $container_id:/home/carla/PythonAPI/. .

  # Allow connection from any host
  sudo xhost +
else
  echo "The Docker container failed to start. Please check your Docker installation and try again."
fi

source carla-venv/bin/activate

# Instal carla
whl_file="./carla/dist/carla-0.9.13-cp37-cp37m-manylinux_2_27_x86_64.whl"
pip install "$whl_file"
