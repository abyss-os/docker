#!/bin/sh
# run this in cron on a system dedicated to building official abyss images
# doesn't HAVE to be dedicated, but strongly suggested
# will deleted and prune your images, beware

cd "$(dirname $0)"
buildah rmi -fa
./all.sh
buildah rmi -fp
