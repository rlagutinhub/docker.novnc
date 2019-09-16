#!/bin/bash

while [ -z "$(ps -ef | grep -i 'run.novnc.sh' | grep -v 'grep')" ]; do
    echo 'Waiting for novnc to start ...'
    sleep 1
done
echo 'novnc started.'

echo 'Starting conky...'
pkill conky; sleep 1; fbsetroot -solid black; conky --config=/app/conky.conf
