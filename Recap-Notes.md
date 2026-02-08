## Linux

ls,ls -a,ls -l,ls -latr
mkdir dir
cd dir
cd .
cd ..
pwd
whoami
hostname
date
touch name.txt
vim name.txt
nano name.txt
chmod 755 file.txt
chmod +x file.txt
ps 
pu aux
kill pId
ls | wc -l
ps aux | grep process
grep pattern file.txt
df -h
cat filename
head filename
head -n 5 filename
tail filename
tail -f filename

systemctl start/restart/reload/stop service
journalctl 

## Shell Scripting

#!/bin/bash --> Shebang
vim name.sh
In order to execute,
chmod +x name.sh
./name.sh
VAR=VALUE
ACCESS: $VAR
Exit Status: 0-255
0 : SUCCESS
Non-zero : FAILURE
$? : returns the exit status of the previously executed command
$# : number of parameters/arguments to file
$@ : accept all
-f FILE(file or not)
-d 
> OVERRIDE
>> APPEND
if [ condition ]
then
  COMMAND
else
  COMMAND
fi
condition: -eq,-ne,-gt,-ge,-lt,-le
if [ condition ]
then
  COMMAND
elif [ condition ]
then
  COMMAND
else
  COMMAND
fi
INPUT: read -p "msg" VAR
for i in NUMBERS
do
  COMMAND
done
while [ condition ]
do
  COMMAND
done

SOME Basic if problems:
if [ -f FILE ]  #FILE or not
then
  COMMAND

if [ "$?" -eq 0 ]
then
  COMMAND

if [ '$#' -eq 0 ]
then
  COMMAND

FUNCTION:

function_name(){

}

Call:
fucntion_name

with argument:
function_name(){
  VAR=$1
}

CALL:
function_name  ARG1 ARG2

Also direct argument from command
./name.sh file_name

$0 file name

set -e [exit when you get error]


## Docker

Docker is used to package applications along with its dependencies .
It solves the "runs in my machine problem"
Suppose , I create a project with react, spring with certain versions. With docker I can package application,
and it will run on other machines with docker

Docker is used to run containers on a single machine.

Docker Life cycle
 
 Build -> Ship -> Run

Image:
  An image is a standardized package that incules all of the files, binaries , libraries  to run a container . An image is made up of layers . Docker using caching in which it uses the images from past builds.
  Built using dockerfile.
  A docker file is a set of instructions that builds an image.

Hub:
  Docker Hub is used to store the images.

Container:
  Docker Container runs the images. It is the runnable instance of an image. A container contains everything
  required to run an application.
  Containers are independent.
  Containers are isolated.


Dockerfile

FROM : specifies the base image
WORKDIR : specifies and creates the working directory
COPY source destination : Copy files from host to container
copy . . : Copy all
RUN : executes command
CMD : specifies default commands that runs when a conatiner starts.
      Can be overriden from Command
ENTRYPOINT : specifies the command that must run when the container starts.
              cannot be done in command
EXPOSE : port in container

In order to reduce the size of the Dockerfile we use:
1. .dockerignore
2. Multistage Dockerfile
3. Combine the RUN statements

COMMANDS:
docker version
docker info

docker run -d -p HOST:CONTAINER --name NAME Image_name
d=detouch mode(run in background)
-p=--publish
OR 
docker container run -d -p HOST:CONTAINER --name NAME Image_name

HOW IT WORKS?
1. docker checks locally in the image cache if the image is available.
2. If its not , then it looks for it in the docker hub.
3. Downloads the image and creates the container.
4. Publishes it to the defined port

dokcer container ls

docker ps

docker container inspect

docker logs CONTAINER_NAME or ID

docker stop CONTAINER_NAME or ID  

docker rm CONTAINER_NAME or ID

docker images

DOCKER rmi IMAGE_NAME 

docker container run -it image

docker exec -it image

docker network ls

docker network create --driver

Docker automatically creates a private network called the bridge network .
Every container gets an IP address and an DNS name.
all containers are connected to the bridge network

docker image build -t name .

Containers are temporary . Everything stored gets deleted when a container is deleted or restarted .
Persistent storage is provided by:
VOlume (docker managed storage)
Bind mounts(access local storage)



## Docker Compose

Docker compose helps to run multiple containers at the same time with a single command .

Docker compose is a yml file

COMMANDS:

 docker compose up
 docker compoe down
 docker compose up --build
 docker compose down -v

 docker-compose.yml file:

 version: specifies the verison of the yml file

 services : specifies the services i.e. containers
    service_name:
       image: specify the image from dokcer hub
       build: if dockerfile is present locally
       ports:
       depends:
       env:
       depends-on:
       volume:
       network:
  
compose file is great!
Docker Compose automatically reads a .env file and provides those values as variables to the docker-compose.yml file.

This happens by default if:

The file is named .env

It is in the same directory as docker-compose.yml
