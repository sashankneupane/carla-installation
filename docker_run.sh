#!/bin/bash

# Run the Docker container
docker run \
  -p 2000-2002:2000-2002 \
  --cpuset-cpus="0-5" \
  --runtime=nvidia \
  --gpus 'all,"capabilities=graphics,utility,display,video,compute"' \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -it \
  carlasim/carla \
  ./CarlaUE4.sh -opengl $1

