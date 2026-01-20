Control Plane(Control Panel)

--Manages nodes and the entire cluster

Nodes

--Machines that runs containers.

Control Plane Components:

1. kube-apiserver
   -Every request goes through the API Server.
   -CLI,UI communicates through the API
   -Entry point of Kubernetes

2. etcd
   -Distributed key value database
   -Stores:
   State
   Config
   Metadata

3. kube-scheduler
   -Descides which node should run the pod
   -Assigns pods to nodes.

4. controller manager
   -continuosly checks the desired and current state

Node Components:

1. kubelet
   -Kubernetes agent running on each nodes
   -Talks to the API Server
   -Ensures containers are running as expected

2. Container Runtime
   -Responsible for creating and running containers.
   Examples:
   Docker
   Containerd
   CRI-O
