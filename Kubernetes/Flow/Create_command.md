General Syntax:

kubectl create <resource-type> <resource-name> [flags]

✅ Examples

1️⃣ Create a Pod

kubectl create pod mypod --image=nginx

2️⃣ Create a Deployment

kubectl create deployment myapp --image=nginx

3️⃣ Create a Service

kubectl create service clusterip myservice --tcp=80:80

4️⃣ Create from a YAML file

kubectl create -f pod.yaml

Flow of Create Command:

End-to-End Flow (Step by Step)
1️⃣ kubectl (Client Side)

kubectl is just a CLI

It does not create anything itself

It converts your command into a Deployment object (JSON/YAML)

📌 This object contains:

kind: Deployment

Image name

Replica count (default = 1)

Pod template

2️⃣ Request Sent to API Server

kubectl sends an HTTP request to:
👉 kube-apiserver

API Server:

Authenticates the request

Authorizes it

Validates it

📌 Every Kubernetes request passes through the API server

3️⃣ etcd Stores the Desired State

API Server stores the Deployment spec in etcd

etcd is the source of truth

At this moment:

❗ Nothing is running yet
Only the desired state is stored

4️⃣ Deployment Controller Detects Change

Deployment Controller (running in control plane):

Watches API server

Sees a new Deployment

It understands:

“I need to ensure 1 ReplicaSet exists”

5️⃣ ReplicaSet Is Created

Deployment Controller creates a ReplicaSet

ReplicaSet has:

Desired replicas = 1

Pod template

📌 ReplicaSet name:

my-nginx-7c9d6f8b9f

6️⃣ ReplicaSet Controller Creates Pod(s)

ReplicaSet Controller sees:

“I need 1 Pod, but 0 exist”

It creates a Pod object

Pod name:

my-nginx-7c9d6f8b9f-x2k4m

📌 Still → Pod is not running yet

7️⃣ Scheduler Assigns a Node

kube-scheduler notices an unscheduled Pod

Selects the best Node

Writes the node name into the Pod spec

8️⃣ kubelet on the Node Takes Over

kubelet (on the selected node):

Watches API server

Sees Pod assigned to its node

kubelet now:

Pulls the image (nginx)

Asks container runtime to create containers

9️⃣ Container Runtime Runs the Container

Container runtime (Docker / containerd):

Creates the container

Starts it

🎉 Your NGINX container is now running inside a Pod

kubectl
↓
API Server
↓
etcd (desired state)
↓
Deployment Controller
↓
ReplicaSet
↓
Pod
↓
Scheduler
↓
kubelet
↓
Container Runtime
↓
Container Running
