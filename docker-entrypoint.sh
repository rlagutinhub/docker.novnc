#!/bin/sh

set -e
set -x

if [ ! -e "${VNC_PASS}" ]; then
    mkdir -p ~/.vnc
    x11vnc -storepasswd ${VNC_PASS} ~/.vnc/passwd
    chmod 0600 ~/.vnc/passwd
else
    exit 1
fi

if [ "${1:0:1}" = '-' ]; then
    set -- supervisord "$@"
fi

if [ "$1" = 'supervisord' ]; then
    shift
    set -- supervisord "$@"
fi

exec "$@"
