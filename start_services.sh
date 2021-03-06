#!/bin/bash

# This shell script is the entrypoint of the Dockerfile.
# It starts the services and has an infinite loop in which it
# check the status of the services. If one of them fails,
# the container is stopped.

# Start the services
service nginx start
service php7.3-fpm start
service mysql start

# Infinite loop. If one of the services fail, the container exits with exit status 1
while sleep 60; do
    service nginx status > /dev/null 2>&1
    NGINX_STATUS="$?"
    service php7.3-fpm status > /dev/null 2>&1
    PHPFPM_STATUS="$?"
    service mysql status > /dev/null 2>&1
    MYSQL_STATUS="$?"

    if [ $NGINX_STATUS -ne 0 -o $PHPFPM_STATUS -ne 0 -o $MYSQL_STATUS -ne 0 ]; then
        echo "One of the processes has exited"
        exit 1
    fi
done
