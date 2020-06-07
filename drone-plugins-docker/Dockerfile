FROM abyssos/abyss:docker-dind

RUN build.sh

ENV DOCKER_HOST=unix:///var/run/docker.sock

ADD drone-docker /usr/bin/
ENTRYPOINT ["/usr/bin/dockerd-entrypoint.sh", "/usr/bin/drone-docker"]
