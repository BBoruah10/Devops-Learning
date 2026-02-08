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

## Kubernetes

### Basics

- Kubernetes 

  K8s is used to run multiple containers on mutliple machines.

  WHEN?
  Multiple Machine(SERVERS) + high CHANGE RATE

  CHANGE RATE : defines how frequently the code changes or get updated.

  Advantages:
   
   1. Self Healing
   2. High Availability


   Kubernetes does not create contianers , it creates PODS that runs Containers.
   Inside node, Kubelet tells the container run time to create and manage pods. 

- Deployment
  
  Deployment is a higher resource type . It manages replicaset.
 
- ReplicaSet 

  ReplicaSet manages Pods.

- Pods 
 
 It is the smallest unit of deployment.Pod is a wrapper around two or more containers that share the same network and storage
 Without Pods?

 Containers single handedly cannot share network or storage.

 Pods runs inside a Node.

- kubectl 

 kubectl is a tool used to configure and manage kubernetes. 

- Nodes
 
 Nodes are the machine that runs pods.

- Control Plane
  
  Control Plane or Panel manages the entire cluster and nodes.

  Components of Control plane:

  1. kube api-server
      Every request goes through the api server.
  2. etcd
      Its is a distributed key value pair .
      Stores:
         Pod info
  3. controller manager
     It contains many controllers like
     deployment controller
  4. kube scheduler
       decides which node should run the pod.

  Components of Node:

  1. kubelet
      A kubernetes agent running on a node
  2. Container run time
      Container run time manages and creates containers.
      Eg: Docker

Two ways to deploy pods:
- Command
- YAML
### Commands

kubectl version

kubectl run my-nginx --image=NAME

WHAT HAPPENS ?

1. kubectl sends request to the kube api server.
2. Request goes to the kube api server . API server authenticates, authorizes and validates.
3. etcd stores state.
4. Scheduler decides which node should run the pods.
5. kubelet tells the container run time to run and manage pods.

kubectl create deployment my-nginx --image=NAME

WHAT HAPPENS ?

1. kubectl sends request to the kube api server.
2. Request goes to the kube api server . API server authenticates, authorizes and validates.
3. etcd stores state.
4. Deployment controller creates replica set
5. Replicaset creates pods.
6. Scheduler decides which node should run the pods.
7. kubelet tells the container run time to run and manage pods.

kubectl apply -f file.yml
kubectl apply -f folder/

kuectl get pods
kubectl get pods -o wide
kubectl get pods -o yml
kubectl get depolyments
kubectl describe pod pod_name
kubectl describe deployment deployment_name

kubectl logs pod_name

- Services
 
 Service is a method of exposing network applications.
 define yml file or directly write commands

 kubectl expose deployment deployment_name type port

 kubectl get svc
 kubectl describe svc

 Four types:
 1. Cluster IP (used for internal communication,Accessible only inside cluster)
 2. Node Port (can be accessed in the broser for testing)
 3. Load Balancer (cloud)
 4. Ingress

USER -> SERVICE -> PODS

WHY?

Pods are temporary . Pods have temporary IP address and name .
Services gives pods permanent name and Ip address .
In order to connect service and pod we must have
 A pod with label
 A service with selectors

 Selector name must match with the label name .

Kubernetes cannot connect using the Ip address of the pods as they are temporary . It uses labels and slectors to connect.

- INGRESS

Ingress is a smart traffic router that routes traffic to service .

Two things:
ingress controller (application that runs in the cluster)
ingress rules(yml files)

Browser -> Ingress Controller -> Service -> pods

## GitHub Actions

GitHub Actions is a workflow automation service by GitHub.
It is used for CI/CD

Components of GitHub Actions:

1. Workflow : Workflows are attached to repository.
    Workflow contains jobs .
    Workflow is executed when an event is triggered.

2. Jobs: Jobs define runners.
    Runnners defines the servers where the workflow will execute .
    Jobs contains Steps.

3. Steps: does the actual work

Woekflows are YML files created inside the .github/workflows file

- Events:

Events can be related to repositories or general

Events related to repository are push,pull_request
General are schedule,workflow_dispatch

Activity types: gives detailed control on when the workflow should bw executed.
   For pull_request its opened,closed
Event filters: provides detailed control on when the workflow should be executed.
   branches:
      main
   path:

- Artifacts:

Artifact are the files generated during the workflow.
Actions provides us options to upload and download artifacts
It helps to reue files

- Dependency Cache:

Dependency Cache are used to reduce the time for installing the dependencies  in a job
We cache the dependency first then install in a job . In other jobs requiring the same dependencies
just reuse from the cache.

- STRUCTURE

name:
on:
  --specifies when the workflow should be executed
jobs:
   job_name:
     runs_on:
      
    steps:
       name:
       run /uses

## Git & GitHub 

Git is a distributed version control system.
It helps to collaborate.
It helps in roll back.

WORKING DIRECTORY -> STAGING AREA -> LOCAL REPO

git init
git status
git add .
git commit -m "msg"

git remote add origin repo_link
git branch origin main
git push -u origin main

git push origin main

git checkout -b branch_name
git checkout branch_name
git branch
git push origin main

git checkout main
git merge branch_name

Pull_Request

When You want to add something to some else's code then have to do a pull_request.

Forking:

Here also pull_request
