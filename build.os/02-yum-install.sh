#! /bin/sh

set -e
set -x

yum -y --setopt=tsflags=nodocs --enablerepo ol7_optional_latest,ol7_developer_EPEL install \
novnc \
python-websockify \
numpy \
x11vnc \
xorg-x11-server-Xvfb \
fluxbox \
xterm \
firefox \
glibc \
glibc-common \
supervisor
