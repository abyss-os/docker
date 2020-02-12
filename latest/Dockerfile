FROM abyssos/abyss:latest AS builder
ARG ABYSS_CORE=https://mirror.abyss.run/abyss/core
ARG ABYSS_DEV=https://mirror.abyss.run/abyss/devel
RUN apk add -X $ABYSS_CORE --no-cache --allow-untrusted --initdb --root /target abyss-base
RUN echo $ABYSS_CORE > /target/etc/apk/repositories
RUN echo $ABYSS_DEV >> /target/etc/apk/repositories

FROM scratch
COPY --from=builder /target /
RUN ["/usr/bin/busybox", "--install", "-s", "/usr/bin"]
RUN apk fix --no-cache
CMD ["/bin/sh"]
