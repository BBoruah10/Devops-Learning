Flow of Run Command

kubectl run image_name --image=image

This creates a single pod

Execution flow:

1. Kubectl sends request to the API server,Request goes to the kube-apiserver
2. State is stored in etcd
3. Scheduler selects a node
4. kublet on that node:
   -talks to container runtime
   -Creates and run containers
