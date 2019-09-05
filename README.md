docker build  -f  Dockerfile -t vnc .

docker ps -a
docker run -dit --name vnc-app --network bridge -p 6080:6080/tcp vnc:latest
docker exec -it vnc-app bash
docker logs vnc-app
docker rm -f vnc-app
