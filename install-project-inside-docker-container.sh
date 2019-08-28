#!/bin/bash
echo "We simply install Docker and run the container (over Raspbian/ARM) ..."

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install curl
curl -sSL https://get.docker.com | sh

sudo groupadd docker
sudo usermod -aG docker pi
newgrp docker

sudo apt-get install debootstrap
sudo debootstrap --variant=minbase --arch=armhf stretch raspbian-stretch http://archive.raspbian.org/raspbian
sudo tar -C raspbian-stretch -c . | docker import - raspbian-stretch

docker build -t ethereum-internet-access .
docker container run --name=my-ethereum-internet-access ethereum-internet-access
docker container ls -a
