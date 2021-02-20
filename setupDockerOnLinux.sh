# Script, store, or docker-machine
# Install Docker
sudo apt-get update; 
sudo snap install docker;
docker --version

# Add your user to docker group to avoid sudo every time
sudo groupadd docker;
sudo usermod -aG docker $USER
sudo gpasswd -a $USER docker
docker run hello-world
docker container run hello-world #new way of doing it
# Get a code editor and gedit
sudo apt-get install git
sudo snap install code --classic
# Tweak your terminal and shell (optional)


#Docker commands
docker version;
docker info;
#docker <command> (options) #old way
#docker <command> <sub-command> (options) #new way

#Image vs container (image is template, container is actual running instance of image)

docker container run --publish 80:80 --detach nginx
docker container run --publish 80:80 --detach --name webhost nginx

docker container logs webhost3

# List all the processes running inside docker
docker container top webhost3

# Remove the instances of container
docker container rm reverent_poincare recursing_bassi sleepy_zhukovsky eloquent_kalam quirky_easley

docker container top <container-name>
ps aux | grep mongo


# Checking on containers
docker container top <container-name>
docker container stats


# Getting a shell inside containers
#Run the same container again
docker container run -it --name ubuntu ubuntu
#will start the same container with name ubuntu, this container will have the installed images
docker container start -ai ubuntu
#see a shell in an already running container
docker container exec -it mysql bash
docker container exec -it <container-name> <process-to-run>

# Docker Networks: Concepts CLI Management
docker container run -p
docker container port <container>

#Show network 
docker network ls
#Inspect network
docker network inspect
#create network
docker network create --driver
#Attach a network to container
docker network connect
#Detach a network from container
docker network disconnect

docker network create my_app_net
docker container run -d --name new_nginx --network my_app_net nginx
docker container run --publish 80:80 --detach --name webhost nginx
docker network connect my_app_net webhost 
docker network inspect my_app_net
docker container inspect webhost # webhost will be connected to 2 networks
docker network disconnect <container-name> <network-name>

Inter communication never leaves host
All externally exposed ports closed by default
We need to manually expose via -p, which is better default security

#Containers shouldn't rely on IP's for inter-communication
#DNS is your friend here, and always create your own network and docker-compose will make all of this easy for you

centos:7 and ubuntu:14.04 using -it
# Use docker container --rm option so that you can save cleanup
# apt-get update && apt-get install curl
# yum update curl
# curl --version

docker container run --rm -it --name centos7 centos:7 bash
docker container run --rm -it --name ubuntu14 ubuntu:14.04 bash


# docker images

