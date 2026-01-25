# 🐳 Docker Swarm Notes & Commands

## 🚀 Initialize Swarm (Manager Node)

```bash
docker swarm init
```

Check swarm status:

```bash
docker info
```

---

## 🤝 Join Worker Node

```bash
docker swarm join --token <token> <manager-ip>:2377
```

---

## 🖥 View Nodes

```bash
docker node ls
```

---

## 📦 Create Service (Run Containers in Swarm)

```bash
docker service create -d \
--name my-service \
-p HOST:CONTAINER \
--replicas 3 \
IMG_NAME
```

---

## 📈 Scale Service

```bash
docker service scale web=5
```

---

## 🌐 Create Overlay Network

```bash
docker network create --driver overlay my_overlay
```

---

## 🔗 Run Service on Overlay Network

```bash
docker service create \
--name backend \
--network my_overlay \
my-backend-image
```

---

## 📋 List Services

```bash
docker service ls
```

---

## 🔍 Service Tasks (Containers)

```bash
docker service ps service_name
```

---

## 📦 Deploy Full Stack (Compose file)

```bash
docker stack deploy -c docker-stack.yaml myapp
```

---

## 🧠 Useful Swarm Tips

```bash
docker stack ls
docker stack services myapp
docker stack ps myapp
```

---

## 🧹 Remove

```bash
docker service rm service_name
docker stack rm myapp
```
