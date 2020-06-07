FROM abyssos/abyss:docker-dind

COPY ./ /build
RUN apk add go
RUN cd /build && CGO_ENABLED=0 go build -v -a -tags netgo -o drone-docker ./cmd/drone-docker
RUN apk del go
RUN mv /build/drone-docker /usr/bin/
RUN rm -rf /build

ENV DOCKER_HOST=unix:///var/run/docker.sock

ENTRYPOINT ["/usr/bin/dockerd-entrypoint.sh", "/usr/bin/drone-docker"]
