#!/bin/sh

# $@: other args, include container
# exports:
# CARCH (container arch)

buildah config \
	--arch $CARCH \
	--author 'Chloe Kudryavtsev <toast@toast.cafe>' \
	--created-by 'Abyss OS <https://abyss.run>' \
	--hostname abyss \
	--shell '/usr/bin/ash -c' \
	"$@"
