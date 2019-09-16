#!/bin/bash

while [ -z "$(ps -ef | grep -i 'run.fluxbox.sh' | grep -v 'grep')" ]; do
    echo 'Waiting for fluxbox to start ...'
    sleep 1
done
echo 'fluxbox started.'

echo 'Starting x11vnc...'
pkill x11vnc; sleep 1; x11vnc -usepw -display :1
