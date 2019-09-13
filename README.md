```
docker build -f Dockerfile -t vnc .

# default settings
docker run -it --rm --name vnc --network bridge -p 6080:6080/tcp vnc:latest

# custom settings
docker run -dit \
 -e "DISPLAY_WIDTH=1920" \
 -e "DISPLAY_HEIGHT=899" \
 -e "VNC_PASS=123456" \
 --network=bridge \
 -p 6080:6080/tcp \
 --name vnc \
 vnc:latest

docker ps -a
docker exec -it vnc bash
docker logs vnc
docker rm -f vnc
```
