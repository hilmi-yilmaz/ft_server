#!/bin/bash

# Turn on/off the autoindex
if [ "$1" == "on" ] || [ "$1" == "off" ]; then
    docker exec -d web_server /bin/autoindex_switch.sh "$1"
else
    echo "No argument specified. Run as: run_switch.sh [on|off]."
fi