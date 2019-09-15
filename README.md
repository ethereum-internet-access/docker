# docker
Run the project in a Docker container

Docker is a tool that allows you to deploy applications inside of software containers. This can be useful for the Raspberry Pi because it allows users to run applications with very little overhead, as long as the application is packaged inside of a Docker image. We simply install Docker and run the container (over Raspbian/ARM).

## Step-by-step instructions

$ sudo apt-get update  
$ sudo apt-get upgrade  

### Install Docker

$ sudo apt-get install curl  
$ curl -sSL https://get.docker.com | sh

### Manage Docker as a non-root user

If we do not want to preface the docker command with sudo.

$ sudo groupadd docker  
$ sudo usermod -aG docker pi  

We can also run the following command to activate the changes to groups.

$ newgrp docker  

### Option A) Create a Raspbian Docker base-image

We need to install debootstrap – a tool for installing a Debian-based Linux distribution into a specified directory on an existing and running operating system.

$ sudo apt-get install debootstrap

The following command will call debootstrap and install Raspbian Stretch (minimal image) into the directory "raspbian-stretch" in the current working directory:

$ sudo debootstrap --variant=minbase --arch=armhf stretch raspbian-stretch http://archive.raspbian.org/raspbian

Then, we need to convert the directory into a docker base image using:

$ sudo tar -C raspbian-stretch -c . | docker import - raspbian-stretch

From that point on you can build your docker images with your own base image by specifying the image in the Dockerfile using "FROM raspbian-stretch".

### Option B) Usage of Alpine Docker image

A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size. NOTE: We will use this B option.

### Create the following Dockerfile

$ nano Dockerfile

```
FROM alpine:latest  
# FROM raspbian-stretch
COPY install-project.sh /  
RUN sh /install-project.sh  
```

### Build 'ethereum-internet-access' Docker image

$ docker build -t ethereum-internet-access .    

### Run the container

$ docker container run --name=my-ethereum-internet-access ethereum-internet-access  
$ docker container ls -a  

NOTE: All these instructions (commands) are included in 'install-project-inside-docker-container.sh' bash script.  

### How to execute it  
 
$ git clone https://github.com/ethereum-internet-access/docker.git  
$ cd docker  
$ sh ./install-project-inside-docker-container.sh  

### (Optional) Upload 'ethereum-internet-access' Docker image to Docker Hub

$ docker tag ethereum-internet-access yourhubusername/ethereum-internet-access:latest  
$ docker login --username=yourhubusername --password=yourpassword  
$ docker push yourhubusername/ethereum-internet-access  

## Next steps

1. Write the required 'install-project.sh' bash script for the Dockerfile.  

```
#!/bin/bash
echo "Installing project ..."
```
