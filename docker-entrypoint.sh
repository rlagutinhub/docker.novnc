#!/bin/sh

set -e
set -x

if [ ! -z "${VNC_PASS}" ]; then
    mkdir -p ~/.vnc
    x11vnc -storepasswd ${VNC_PASS} ~/.vnc/passwd
    chmod 0600 ~/.vnc/passwd
else
    exit 1
fi

# openssl req -new -x509 -days 36500 -nodes -batch -out /app/novnc.pem -keyout /app/novnc.pem
# if [ $? -ne 0 ]; then exit 1; fi

if [ "${1:0:1}" = '-' ]; then
    set -- supervisord "$@"
fi

if [ "$1" = 'supervisord' ]; then
    shift
    set -- supervisord "$@"
fi

exec "$@"
