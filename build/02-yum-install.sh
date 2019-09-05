#! /bin/sh

set -e
set -x

# system
yum -y --setopt=tsflags=nodocs install \
novnc \
python-websockify \
numpy \
tigervnc-server \
fluxbox \
xterm \
firefox \
glibc \
glibc-common \
supervisor
