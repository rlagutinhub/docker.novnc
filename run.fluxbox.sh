#!/bin/bash

while [ -z "$(ps -ef | grep -i 'run.xvfb.sh' | grep -v 'grep')" ]; do
    echo 'Waiting for Xvfb to start ...'
    sleep 1
done
echo 'Xvfb started.'

echo 'Starting fluxbox...'
pkill fluxbox; sleep 1; fluxbox
