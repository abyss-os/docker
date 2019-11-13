#!/bin/sh
if [ ! -f /tmp/abyss-dev ]; then
    abuild-keygen -ain
    sudo apk update
    touch /tmp/abyss-dev
fi
exec "$@"
