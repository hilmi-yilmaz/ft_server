#!/bin/bash

# Build the container and call it ft_server
docker build -t ft_server .

# Run the container, mapping ports 80 and 443 to the Docker Host
docker run --name web_server -d --rm -p 80:80 -p 443:443 ft_server