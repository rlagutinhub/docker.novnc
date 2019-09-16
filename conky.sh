#!/bin/bash

while [ -z "$(ps -eo args | grep -iw '^x11vnc' | grep -iv 'grep')" ]; do sleep 1; done
sleep 10; fbsetroot -solid black; sleep 10; conky --config=/app/conky.conf
while [ ! -z "$(ps -eo args | grep -iw '^conky' | grep -iv 'grep')" ]; do sleep 600; done
