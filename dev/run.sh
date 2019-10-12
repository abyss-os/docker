#!/bin/sh
abuild-keygen -an
abuild-apk update
exec "$@"
