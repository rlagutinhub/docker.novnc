#!/bin/bash

while [ -z "$(ps -ef | grep -i 'run.x11vnc.sh' | grep -v 'grep')" ]; do
    echo 'Waiting for x11vnc to start ...'
    sleep 1
done
echo 'x11vnc started.'

echo 'Starting xterm...'
pkill xterm; sleep 1; xterm
