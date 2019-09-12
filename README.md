```
docker build -f Dockerfile -t vnc .

docker run -it --rm --name vnc --network bridge -p 6080:6080/tcp vnc:latest

docker ps -a
docker exec -it vnc bash
docker logs vnc
docker rm -f vnc
```
