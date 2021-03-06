#!/bin/bash

# This is a script with which we can turn on or off the autoindex for nginx

SWITCH="$1"

if [ $SWITCH == "on" ]; then
    echo "Turn on the autoindex."
elif [ $SWITCH == "off" ]; then
    echo "Turn off the autoindex."
else
    echo "Invalid input. Run as: ./autoindex_switch.sh [on | off]"
    exit 1
fi

# Change the value inside the nginx.conf file
PATH="/etc/nginx/conf.d/"
grep -q "autoindex off;" ${PATH}nginx.conf              # Look for "autoindex off;" in nginx.conf
CURRENT="$?"                                            # 0 means off, 1 if on
if [ $CURRENT == "0" ] && [ $SWITCH == "on" ]; then
    sed -i 's/off;/on;/g' ${PATH}nginx.conf
    service nginx reload
elif [ $CURRENT == "1" ] && [ $SWITCH == "off" ]; then
    sed -i 's/on;/off;/g' ${PATH}nginx.conf
    service nginx reload
fi