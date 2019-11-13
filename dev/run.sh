#!/bin/sh
if [ -f /tmp/abyss-dev ]; do
    abuild-keygen -an
    sudo apk update
    touch /tmp/abyss-dev
done
exec "$@"
