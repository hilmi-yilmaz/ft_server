#!/bin/bash

# Build the container and call it ft_server
docker build -t ft_server .

# Run the container, mapping ports 80 and 443 to the Docker Host
docker run --name web_server -d --rm -p 80:80 -p 443:443 ft_server

# If argument specified, turn on/off the autoindex
# if [ "$1" == "on" ] || [ "$1" == "off" ]; then
#     docker exec -d web_server /bin/bash /bin/autoindex_switch.sh "$1"
# fi