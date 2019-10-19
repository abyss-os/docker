#!/bin/sh
abuild-keygen -an
sudo apk update
exec "$@"
