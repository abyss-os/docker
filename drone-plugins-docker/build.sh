#!/bin/sh
case "$(uname -m)" in
	x86_64) buildarch=amd64;;
	aarch64) buildarch=arm64;;
	*) buildarch=$(uname -m);;
esac

apk add go
CGO_ENABLED=0 go build -v -a -tags netgo -o drone-docker ./cmd/drone-docker
apk del go
