# noVNC Display Container
```
```
This image is intended to be used for displaying X11 applications from other containers in a browser.

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
* `RUN_XTERM={yes|no}` (yes)
* `RUN_FLUXBOX={yes|no}` (yes)

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
Open a browser and see the `xterm` and `firefox` demo at `http://<server>:6080`

```
docker build -f Dockerfile -t vnc .

# default settings


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
