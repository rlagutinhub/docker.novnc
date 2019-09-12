docker build -f Dockerfile.os -t vnc.os .
docker build -f Dockerfile.app -t vnc.app .

docker run -it --rm --name vnc-app --network bridge -p 6080:6080/tcp vnc.app:latest

docker ps -a
docker run -dit --name vnc-app --network bridge -p 6080:6080/tcp vnc.app:latest
docker exec -it vnc-app bash
docker logs vnc-app
docker rm -f vnc-app
