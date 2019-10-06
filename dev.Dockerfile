FROM registry.gitlab.com/abyssos/abyss-docker/abyss:latest
RUN apk add --no-cache abuild bsdtar clang lld
RUN ln -sf /usr/bin/bsdtar /usr/bin/tar
RUN adduser -D -h /home/buildozer buildozer
RUN adduser buildozer abuild
USER buildozer
