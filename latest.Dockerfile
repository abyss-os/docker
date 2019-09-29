FROM alpine:edge AS builder
ARG ABYSS_CORE=https://mirror.getabyss.com/abyss/core
RUN apk add -X $ABYSS_CORE --no-cache --allow-untrusted apk-tools-static
RUN apk.static add -X $ABYSS_CORE --no-cache --allow-untrusted --initdb --root /target filesystem
RUN apk.static add -X $ABYSS_CORE --no-cache --allow-untrusted --initdb --root /target abyss-keyring ca-certificates apk-tools busybox
RUN echo $ABYSS_CORE > /target/etc/apk/repositories

FROM scratch
COPY --from=builder /target /
RUN ["/usr/bin/busybox", "--install", "/usr/bin"]
RUN apk fix --no-cache
CMD ["/bin/sh"]
