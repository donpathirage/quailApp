#!/bin/bash

# Script to install docker, nvidia container toolkit, and the quaildetector container

echo "Installing Docker"

curl https://get.docker.com | sh \
  && sudo systemctl --now enable docker

echo "Installing Nvidia container toolkit"
  
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
   
curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

sudo apt-get update

sudo apt-get install -y nvidia-docker2

sudo systemctl restart docker

sudo groupadd docker

sudo usermod -aG docker $USER

echo "Installing quaildetector"

sudo docker pull donpathirage/quaildetector:1.0
