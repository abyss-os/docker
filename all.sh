#!/bin/sh
set -e
cd "$(dirname $0)"

image='abyssos/abyss'
remote='docker.io'
raddr="docker://$remote"

# conditional rmi if the image exists
rmi() {
	buildah images --format '{{.Name}}:{{.Tag}}' | grep $1 && buildah rmi $1 || true
}

main() {
	loc=localhost/$image:$1
	rmt=$raddr/$image:$1

	# if you don't do this, we'll be adding images to the existing manifest
	rmi $loc
	./build.sh $1.sh

	# pushing is required because of how buildah handles --from
	buildah manifest push --all $loc $rmt
}

main latest
# latest is used to build the rest, so we overtag
rmi $remote/$image
buildah tag localhost/$image $remote/$image
rmi localhost/$image

main dev
