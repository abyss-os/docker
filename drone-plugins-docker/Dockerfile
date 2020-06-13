FROM abyssos/abyss:docker-dind

COPY ./drone-docker /usr/bin/drone-docker

ENV DOCKER_HOST=unix:///var/run/docker.sock

ENTRYPOINT ["/usr/bin/dockerd-entrypoint.sh", "/usr/bin/drone-docker"]
