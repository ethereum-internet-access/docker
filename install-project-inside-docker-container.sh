#!/bin/bash
echo "We simply install Docker and run the container ..."

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install curl
curl -sSL https://get.docker.com | sh

sudo groupadd docker
sudo usermod -aG docker pi
newgrp docker

docker build -t ethereum-internet-access .
docker container run --name=my-ethereum-internet-access ethereum-internet-access
docker container ls -a
