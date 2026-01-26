Imperative commands

You directly tell Kubernetes what to do.

Example:

kubectl run nginx --image=nginx
kubectl delete pod nginx

✅ Best for:

Quick testing

Learning

Dev environment

❌ Bad for:

Version control

Team projects

Production

🔹 Imperative object configuration

You create resources using YAML files, but apply them one by one.

kubectl create -f pod.yaml
kubectl replace -f pod.yaml

✅ Best for:

Small production setups

Controlled environments

⚠️ Slightly harder to track changes
🔹 Declarative object configuration (BEST PRACTICE)

You manage everything as desired state in folders.

kubectl apply -f k8s/

Kubernetes figures out:

➡️ what to create
➡️ what to update
➡️ what to delete

✅ Best for:

Real production

GitOps

Teams

Helm/Kustomize

🎯 Real-world rule
Stage Use
Learning Imperative
Dev Imperative
Real projects Declarative
