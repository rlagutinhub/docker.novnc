#!/bin/sh

set -e
set -x

VNC_PASS=${VNC_PASS:-123456}

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
    # set -- "$(which supervisord)" "$@"
    set -- supervisord "$@"
fi

exec "$@"
