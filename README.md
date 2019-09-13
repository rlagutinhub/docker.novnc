# noVNC Display Container
```
```
This image is intended to be used for displaying X11 applications from container in a browser.

## Image Contents

* [Xvfb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - X11 in a virtual framebuffer
* [x11vnc](http://www.karlrunge.com/x11vnc/) - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/) - a small window manager
* [xterm](http://invisible-island.net/xterm/) - to demo that it works
* [firefox](https://www.mozilla.org) - web browser developed by the Mozilla Foundation
* [supervisord](http://supervisord.org) - to keep it all running

## Usage

### Variables

You can specify the following variables:
* `DISPLAY_WIDTH=<width>` (1024)
* `DISPLAY_HEIGHT=<height>` (768)
* `VNC_PASS=<password>` (passw0rd)

### Stand-alone Demo
Run with default settings:
```bash
docker run -it --rm --name vnc --network bridge -p 6080:6080/tcp vnc:latest
```
Run with custom settings:
```bash
docker run -dit \
 -e "DISPLAY_WIDTH=1920" \
 -e "DISPLAY_HEIGHT=899" \
 -e "VNC_PASS=123456" \
 --network=bridge \
 -p 6080:6080/tcp \
 --name vnc \
 vnc:latest
```

### Composition
Run with custom settings:
```bash
version: '3.7'
services:
  vnc:
    image: vnc:latest
    environment:
      - DISPLAY_WIDTH=1600
      - DISPLAY_HEIGHT=968
      - VNC_PASS=123456
    ports:
      - 6080:6080/tcp
    networks:
      - bridge
networks:
  bridge:
    external: true
```

Open a browser and see the `xterm` and `firefox` demo at `http://<server>:6080`

## On DockerHub / GitHub
___
* DockerHub [rlagutinhub/docker.novnc](https://hub.docker.com/r/rlagutinhub/docker.novnc)
* GitHub [rlagutinhub/docker.novnc](https://github.com/rlagutinhub/docker.novnc)
