#!/bin/bash

echo 'Starting Xvfb...'
pkill Xvfb; sleep 1; Xvfb :1 -extension GLX -screen 0 "%(ENV_DISPLAY_WIDTH)s"x"%(ENV_DISPLAY_HEIGHT)s"x24 -listen tcp -ac
