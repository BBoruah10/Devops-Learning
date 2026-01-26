Why do we need Services in Kubernetes?

In Kubernetes:

Pods are temporary (they die and get recreated)

Every new Pod gets a new IP

You cannot rely on Pod IPs

👉 Service solves this problem

✅ What a Service does:

Gives a stable IP & DNS name

Load balances traffic across Pods

Exposes Pods inside or outside the cluster

📌 Simple definition

A Service is a permanent entry point to access a group of Pods.

🔹 How Service works (very important)
User → Service → Pods

Service does NOT run your app

It selects Pods using labels

Traffic is distributed among matching Pods

🔹 Things required to create a Service
1️⃣ Pods with labels

Service finds Pods using labels.

Example Pod/Deployment label:

labels:
app: nginx

2️⃣ Service with selector

Selector must match Pod labels.

selector:
app: nginx

3️⃣ Port mapping

Service maps:

service port → container port

🔹 Types of Kubernetes Services (VERY IMPORTANT)
1️⃣ ClusterIP (Default)

📌 Use case

Internal communication

Backend, DB, microservices

🔹 Features

Accessible only inside cluster

Cannot be accessed from browser

Example:
kubectl expose deployment nginx-deploy \
 --name=nginx-service \
 --port=80 \
 --target-port=80

YAML:
apiVersion: v1
kind: Service
metadata:
name: nginx-service
spec:
type: ClusterIP
selector:
app: nginx
ports: - port: 80
targetPort: 80

📌 Access inside cluster

curl http://nginx-service

2️⃣ NodePort

📌 Use case

Simple external access (testing, learning)

🔹 Features

Exposes service on every node’s IP

Port range: 30000–32767

Example:
apiVersion: v1
kind: Service
metadata:
name: nginx-nodeport
spec:
type: NodePort
selector:
app: nginx
ports: - port: 80
targetPort: 80
nodePort: 30007

Access:
http://<Node-IP>:30007

⚠️ Not recommended for production

3️⃣ LoadBalancer

📌 Use case

Production apps

Cloud environments (AWS, GCP, Azure)

🔹 Features

Automatically creates cloud load balancer

Provides public IP

Example:
apiVersion: v1
kind: Service
metadata:
name: nginx-lb
spec:
type: LoadBalancer
selector:
app: nginx
ports: - port: 80
targetPort: 80

Get External IP:
kubectl get svc

EXTERNAL-IP 35.190.xx.xx

4️⃣ Headless Service (Advanced)

📌 Use case

Stateful apps (DBs)

Direct Pod-to-Pod communication

🔹 Feature

No load balancing

No ClusterIP

spec:
clusterIP: None

🔹 Important Service Concepts (Simple)
🔸 Selector

Links Service to Pods

selector:
app: nginx

🔸 Ports
Field Meaning
port Service port
targetPort Container port
nodePort External port
🔸 Endpoints

Behind the scenes:

kubectl get endpoints nginx-service

Shows Pod IPs linked to Service.

🔹 Common Commands (Must Know)

# List services

kubectl get svc

# Describe service

kubectl describe svc nginx-service

# Delete service

kubectl delete svc nginx-service

🔹 Service vs Pod (Quick Comparison)
Pod Service
Temporary Permanent
Has changing IP Stable IP
Runs containers Routes traffic
No load balancing Load balances
🔹 Real-life analogy 🏠

Pods → Workers

Service → Reception desk

Clients talk to reception, not workers directly

🔹 When to use which Service?
Scenario Service
Internal microservices ClusterIP
Testing from browser NodePort
Production public app LoadBalancer
Database / Stateful app Headless
✅ Final takeaway

✔ Kubernetes never exposes Pods directly
✔ Service = stable access + load balancing
✔ Most common: ClusterIP
✔ Production external access: LoadBalancer

# Lab

Goal of this Lab

You will:

Create a Deployment (nginx Pods)

Create a Service (expose Pods)

Access the app

See load balancing

Scale Pods and observe behavior

✅ Prerequisites

Kubernetes cluster running (Minikube / Kind / Cloud)

kubectl configured

Check:

kubectl get nodes

🧩 STEP 1: Create a Deployment

👉 Deployment creates and manages Pods.

Command:
kubectl create deployment nginx-deploy --image=nginx

What just happened (simple):

Kubernetes created a Deployment

Deployment created 1 Pod

Pod runs nginx container

Check:

kubectl get deployments
kubectl get pods

🧩 STEP 2: Expose Deployment as a Service (ClusterIP)

👉 Now we create a Service so Pods can be accessed.

Command:
kubectl expose deployment nginx-deploy --port=80 --target-port=80

What this does:

Creates a ClusterIP Service

Connects Service → Pods using labels

Gives a stable internal IP

Check:

kubectl get svc

You’ll see something like:

nginx-deploy ClusterIP 10.96.xxx.xxx 80/TCP

🧩 STEP 3: Test Service from Inside Cluster

Run a temporary Pod:

kubectl run test --image=busybox -it --rm -- sh

Inside the pod:

wget -qO- http://nginx-deploy

✅ You should see nginx welcome page HTML

👉 This proves:

Service → Pod → Container

Exit:

exit

🧩 STEP 4: Scale the Deployment (IMPORTANT)

👉 Now we create multiple Pods.

kubectl scale deployment nginx-deploy --replicas=3

Check:

kubectl get pods -o wide

You’ll see 3 Pods, each with different IPs.

🧩 STEP 5: Verify Load Balancing

Run again:

kubectl run test --image=busybox -it --rm -- sh

Inside:

wget -qO- http://nginx-deploy

👉 Kubernetes Service:

Automatically balances traffic

Requests go to any of the 3 Pods

(Service uses round-robin-like behavior)

🧩 STEP 6: Expose App Outside (NodePort)

👉 Now let’s access from browser.

kubectl expose deployment nginx-deploy \
 --type=NodePort \
 --port=80

Check:

kubectl get svc

Output:

nginx-deploy NodePort 10.96.xx.xx 80:30007/TCP

Access in Browser:
http://<Node-IP>:30007

User
↓
Service (stable IP)
↓
Endpoints
↓
Pods (dynamic IPs)
↓
Containers
