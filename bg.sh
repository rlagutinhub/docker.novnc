#!/bin/bash

while [ -z "$(ps -ef | grep -i 'x11vnc' | grep -v 'grep')" ]; do sleep 1; done
sleep 10; fbsetroot -solid black; sleep 10; conky --config=/app/conky.conf 
while [ ! -z "$(ps -ef | grep -i 'conky' | grep -v 'grep')" ]; do sleep 1; done
