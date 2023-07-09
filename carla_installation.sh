#!/bin/bash

# Remove existing installations that might create conflicts
sudo apt-get remove docker.io docker-doc docker-compose podman-docker containerd runc -y

# Install necessary dependencies
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Get Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install docker engine
sudo apt-get update
sudo apt-get instal -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Install nvidia-container-toolkit

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && \
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg && \
curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

# Restart the docker and configure it to recognize the NVIDIA Container Runtime
sudo systemctl restart docker
sudo nvidia-ctk runtime configure --runtime=docker

# Restart docker to apply the updated configuration
sudo systemctl restart docker

# pull the latest docker image
sudo docker pull carlasim:carla:latest

# Install Python 3.7 if not already installed
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.7

# Install virtualenv
sudo apt install -y python3.7-venv
