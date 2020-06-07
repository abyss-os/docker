FROM abyssos/abyss:latest

RUN apk add --no-cache \
		ca-certificates \
		openssh \
		btrfs-progs \
		e2fsprogs \
		e2fsprogs-extra \
		iptables \
		openssl \
		shadow-uidmap \
		xfsprogs \
		xz \
		pigz \
		docker

RUN set -x \
	&& addgroup -S dockremap \
	&& adduser -S -G dockremap dockremap \
	&& echo 'dockremap:165536:65536' >> /etc/subuid \
	&& echo 'dockremap:165536:65536' >> /etc/subgid

COPY dockerd-entrypoint.sh /usr/bin/

VOLUME /var/lib/docker
EXPOSE 2375 2376

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []
