#!/bin/bash

while [ -z "$(ps -ef | grep -i 'run.x11vnc.sh' | grep -v 'grep')" ]; do
    echo 'Waiting for x11vnc to start ...'
    sleep 1
done
echo 'x11vnc started.'

echo 'Starting novnc...'
pkill websockify; sleep 1; websockify --web /usr/share/novnc 6080 localhost:5900
# pkill websockify; sleep 1; websockify --web /usr/share/novnc 6080 localhost:5900 --cert /app/novnc.pem --ssl-only
