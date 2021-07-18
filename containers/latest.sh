#!/bin/sh
set -e

# export:
# AARCH: (apk arch)
# CARCH: (container arch)

# mirror for -X, thanks apk
mirror=$(head -n1 data/repositories)

c=$(buildah from --arch $CARCH scratch)
. data/config.sh --cmd '/usr/bin/ash --login' $c

# create rootfs
b=$(buildah from docker.io/abyssos/abyss:latest)
buildah copy $b data/repositories /etc/apk/repositories

# we expect this to partially fail, we run fix later
buildah run $b -- apk add -X $mirror --no-cache --allow-untrusted --initdb --root /target --arch $AARCH abyss-base || true
buildah copy $b data/repositories /target/etc/apk/repositories

m=$(buildah mount $b)
buildah copy $c $m/target
buildah unmount $b
buildah rm $b

# finalize container
buildah run $c -- /usr/bin/busybox --install -s /usr/bin
buildah run $c -- apk fix --no-cache

buildah commit --manifest localhost/abyssos/abyss:latest $c
buildah rm $c
