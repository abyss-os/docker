#!/bin/sh
if [ ! -f /tmp/abyss-dev ]; then
	abuild-keygen -ain
	apk update
	touch /tmp/abyss-dev
fi
exec "$@"
