#!/usr/bin/env bash
# shellcheck disable=SC1090

###
### Only root user can run this
###
if [ ! "$(id -u)" = "0" ]; then
    echo "Only root user can run this container"
    echo "To use a specific user define the USER variable"
    echo "For more information, visit https://github.com/docker-suite/alpine-base"
    exit 1
fi

###
### Source libs in /etc/entrypoint.d
###
for file in $( find /etc/entrypoint.d/ -name '*.sh' -type f | sort -u ); do
    source "${file}"
done

###
### Source custom user supplied libs in /startup.d
###
source_scripts "/startup.d"

###
### Run custom user supplied scripts
###
execute_scripts "/startup.1.d"
execute_scripts "/startup.2.d"

### Run with the correct user
if [ -n "$USER" ]; then
    DEBUG "Running as user $USER"
    set -- su-exec "$USER" dockerd-entrypoint.sh "$@"
else
    set -- dockerd-entrypoint.sh "$@"
fi

### Execute script with arguments
exec "${@}"
