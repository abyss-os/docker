FROM abyssos/abyss:latest
RUN apk add --no-cache ca-certificates git git-lfs openssh curl perl

ADD posix/* /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/clone"]
