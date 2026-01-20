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
