#!/bin/bash
echo "We simply run the container that includes the project application."

sudo groupadd docker
sudo usermod -aG docker pi
newgrp docker

docker build -t ethereum-internet-access .
docker container run --name=my-ethereum-internet-access ethereum-internet-access
docker container ls -a
