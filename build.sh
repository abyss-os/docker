#!/bin/sh
cd "$(dirname $0)"

# this will go over the platforms
# define AARCH and CARCH
# and exec buildah unshare "$@"

# AARCH.CARCH
platforms='x86_64:amd64 aarch64:arm64 ppc64le:ppc64le'
script=$1
shift

for arch in $platforms; do
	export AARCH=${arch%%:*} CARCH=${arch#*:}
	buildah unshare containers/$script "$@"
done
