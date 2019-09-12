#!/bin/sh

set -e
set -x

RUN_FLUXBOX=${RUN_FLUXBOX:-yes}
RUN_XTERM=${RUN_XTERM:-yes}
VNC_PASS=${VNC_PASS:-123456}

case $RUN_FLUXBOX in
    false|no|n|0)
        rm -f /app/conf.d/fluxbox.conf
        ;;
esac

case $RUN_XTERM in
    false|no|n|0)
        rm -f /app/conf.d/xterm.conf
        ;;
esac

if [ ! -e "${VNC_PASS}" ]; then
    mkdir -p ~/.vnc
    echo "${VNC_PASS}" | vncpasswd -f > ~/.vnc/passwd
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
