# 🧠 Kubernetes Hands-On Task Ladder (Easy → Advanced)

---

## 🟢 Level 1 — Cluster Basics

### Task 1

List all nodes in the cluster.

### Task 2

List all namespaces and identify system namespaces.

### Task 3

List all pods across all namespaces.

### Task 4

Check which Kubernetes components are running in `kube-system`.

---

## 🟡 Level 2 — Pod Operations

### Task 5

Create a pod running `nginx` using kubectl (no YAML).

### Task 6

Describe the pod and observe scheduling, events, and IP address.

### Task 7

Fetch logs from the pod.

### Task 8

Delete the pod and observe what happens.

---

## 🟠 Level 3 — Deployments & Self Healing

### Task 9

Create a Deployment with 2 replicas running nginx.

### Task 10

List deployments, ReplicaSets, and pods.

### Task 11

Delete one pod created by the Deployment and observe self-healing.

### Task 12

Scale the Deployment to 5 replicas.

### Task 13

Scale back to 1 replica.

---

## 🔵 Level 4 — Services & Networking

### Task 14

Expose the Deployment using a NodePort Service.

### Task 15

Access the application using the Service endpoint.

### Task 16

List all services and identify ClusterIP vs NodePort.

---

## 🔴 Level 5 — Failure & Debugging

### Task 17

Break the Deployment by using an invalid image tag.

### Task 18

Observe pod status and identify the failure type.

### Task 19

Use describe to find the root cause from Events.

### Task 20

Fix the Deployment and restore healthy pods.

---

## 🟣 Level 6 — Resource Management

### Task 21

Add very low memory limits to the container.

### Task 22

Trigger a pod crash due to resource limits.

### Task 23

Identify the crash reason using describe.

### Task 24

Fix resource limits and recover the application.

---

## 🟤 Level 7 — ConfigMaps

### Task 25

Create a ConfigMap with application environment variables.

### Task 26

Inject ConfigMap values into the Deployment as environment variables.

### Task 27

Verify the variables inside the running pod.

---

## ⚫ Level 8 — Secrets

### Task 28

Create a Secret containing database credentials.

### Task 29

Inject Secret values into the Deployment.

### Task 30

Verify Secret values inside the pod.

---

## 🌐 Level 9 — Ingress (Production Routing)

### Task 31

Create an Ingress resource for hostname-based routing.

### Task 32

Map a local domain to the Ingress.

### Task 33

Access the application using the domain.

---

## 🧱 Level 10 — Real-World Operations

### Task 34

Perform a rolling update of the Deployment.

### Task 35

Rollback to a previous version.

### Task 36

Monitor pod recreation during updates.

### Task 37

Simulate node failure and observe pod rescheduling.

---

## 🎯 Level 11 — Production Thinking (Written)

### Task 38

Explain why Deployments are preferred over standalone Pods.

### Task 39

Explain how Kubernetes achieves high availability.

### Task 40

Explain the role of Services and Ingress.

### Task 41

Explain how ConfigMaps and Secrets differ.

### Task 42

Explain how Kubernetes handles application failures.

---

## 🚀 Bonus Advanced Challenges

### Task 43

Deploy a multi-container pod.

### Task 44

Connect two services internally.

### Task 45

Create environment-specific configs using namespaces.

### Task 46

Convert your setup into Helm charts.

### Task 47

Deploy using CI/CD pipeline.
