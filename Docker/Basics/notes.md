# 🐳 Docker Commands – Complete Cheat Sheet

Docker is used to package applications into containers so they run consistently across environments.

---

## 📦 Container Management

### List containers

```bash
docker ps
docker ps -a


docker run image-name
docker run -d image-name
docker run -p HOST:CONTAINER image-name
docker run --name NAME image-name
docker run -it image-name bash
docker run -e KEY=value image-name
docker run -v host-path:container-path image-name

###Running containers

docker exec -it container-name bash
docker stop container-name
docker start container-name
docker restart container-name
docker rm container-name

###Docker Image

docker build -t image-name .
docker images
docker rmi image-name
docker tag image-name username/image-name
docker push username/image-name

###Docker Compose

docker compose up
docker compose up -d
docker compose up --build
docker compose down

###Clean Up

docker container prune
docker image prune
docker volume prune
docker system prune


###Debugging & Info
docker logs container-name
docker inspect container-name
docker stats
```
