FROM abyssos/abyss:latest
RUN apk add --no-cache git go gmake
RUN [ "/usr/bin/ln", "-s", "/usr/bin/gmake", "/usr/bin/make" ]
ENTRYPOINT [ "go" ]
