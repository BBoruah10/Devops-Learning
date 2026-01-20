Kubernetes is an open source orchestration platform used to manage , deploy, scale, and operate containerized applications across multiple machines (nodes).

Provides CLI/API
CLI:user communicates with kubernetes
API:the machines talk to kubernetes

When should we use kubernetes?

Multiple Servers + High complexity + High Change Rate

Servers(Nodes) : These are the machines that runs containers.
Change Rate : How frequently applications are updated, developed or scale

Advantages of Kubernetes:

1. Self Healing
2. Auto Scheduling
3. High Availability
4. Auto Scaling
5. Flexible

Why Kubernetes?

Flexible and powerful i.e. supports a large set of use cases.
The Core Problem Kubernetes Solves

When applications grow, we face issues like:

❌ Too many containers to manage manually

❌ Frequent application updates (high change rate)

❌ Server failures

❌ Traffic spikes

❌ Downtime during deployments

Kubernetes handles all this automatically.

Docker Swarm vs Kubernetes

Docker Swarm:

1. Its a Docker built in tool
2. Docker Swarm is easy to manage and configure
3. Easy to troubleshoot
4. Best for small clusters and low complexity

Kubernetes:

1. Kubernetes is highly flexible
2. Supports complex production workloads.
3. Best for large scale systems

PODS:
The smallest unit of deployument.
A pod is a warapper around one or more containers tht share the same network , storage .
A Pod provides:

✅ Shared network (same IP, same ports)
✅ Shared storage (volumes)
✅ Shared lifecycle

Two ways to deploy pods:
Command
YAML

WHY PODS?

Containers cannot share network , storage
✔️ Corrected & Polished Explanation (K8s vs Docker)

Unlike Docker, you cannot create a container directly in Kubernetes.
In Kubernetes, you create Pods, not containers.

✔️ How it works in Kubernetes

You create a Pod

Via:

CLI (kubectl)

YAML manifest

Kubernetes API

Kubernetes creates the Pod

Kubernetes does NOT directly create containers

-It only manages Pod specifications

-kubelet steps in

-Runs on each node

-Watches the API server

-Sees a Pod assigned to its node

-kubelet tells the container runtime

Runtime examples:

containerd

CRI-O

“Create and run these containers”

Container runtime creates containers

Pulls images

Starts containers

Reports status back to kubelet

---Kubernetes does not create containers directly. It creates Pods, and the kubelet instructs the container runtime to create and run containers inside those Pods.

kubectl : CLI used to configure the kubernetes
