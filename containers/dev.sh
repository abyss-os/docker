#!/bin/sh
set -e

# export:
# CARCH: (container arch)

c=$(buildah from --arch $CARCH docker.io/abyssos/abyss:latest)
. data/config.sh --cmd '/usr/bin/ash --login' --entrypoint '["/run.sh"]' $c

buildah run $c -- apk add --no-cache abyss-base-dev
buildah run $c -- ln -s gmake /usr/bin/make
buildah run $c -- toolchain none llvm

buildah copy $c data/dev/run.sh /run.sh
buildah copy $c data/dev/abuild.conf /root/.abuild/abuild.conf

buildah commit --manifest localhost/abyssos/abyss:dev $c
buildah rm $c
