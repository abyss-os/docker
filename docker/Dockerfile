FROM abyssos/abyss:latest

RUN apk add --no-cache \
		ca-certificates \
		openssh \
		btrfs-progs \
		e2fsprogs \
		iptables \
		openssl \
		shadow \
		xz \
		pigz \
		docker

RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

RUN set -x \
	&& addgroup -S dockremap \
	&& adduser -S -G dockremap dockremap \
	&& echo 'dockremap:165536:65536' >> /etc/subuid \
	&& echo 'dockremap:165536:65536' >> /etc/subgid

COPY docker-entrypoint.sh /usr/bin/

ENV DOCKER_TLS_CERTDIR=/certs
RUN mkdir /certs /certs/client && chmod 1777 /certs /certs/client

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
