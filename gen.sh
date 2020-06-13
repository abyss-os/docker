#!/bin/sh
# horrible script to try and dump out a semi comprehensible .drone.yml

# ourarch:docker pairs
PLATFORMS="x86_64:amd64 aarch64:arm64 ppc64le:ppc64le mips64:mips64"
# list of directories to build
IMAGES="latest dev go drone-git docker"
# repo to dump arch images
TARGETREPO="abyssos/abyss-archive"
# repo to dump the manifests in
REPO="abyssos/abyss"

# iterate platforms
for p in $PLATFORMS; do
	echo "kind: pipeline
type: docker
name: ${p%%:*}

platform:
  os: linux
  arch: ${p#*:}

common_settings: &cs
  username:
    from_secret: DOCKER_USERNAME
  password:
    from_secret: DOCKER_PASSWORD
  repo: ${TARGETREPO}
";

# iterate images
echo "steps:"
for i in $IMAGES; do
echo "- name: $i
  image: ${REPO}:drone-plugins-docker
  settings:
    <<: *cs
    context: $i
    dockerfile: ${i}/Dockerfile
    tags: ${i}-${p#*:}
";done;

echo "---";

done

# do manifests
echo "kind: pipeline
type: docker
name: manifest

common_settings: &cs
  username:
    from_secret: DOCKER_USERNAME
  password:
    from_secret: DOCKER_PASSWORD
  ignore_missing: true
  platforms:"
for p in $PLATFORMS; do
echo "  - linux/${p#*:}"
done

for i in $IMAGES; do
echo "
steps:
- name: $i
  image: ${REPO}:drone-plugins-manifest
  settings:
    <<: *cs
    target: ${REPO}:${i}
    template: ${TARGETREPO}:${i}-ARCH"
done

echo "
depends_on:"
for p in $PLATFORMS; do
echo "- ${p%%:*}"
done
