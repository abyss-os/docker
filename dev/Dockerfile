FROM abyssos/abyss:latest
ARG ABYSS_CORE=http://mirror.abyss.run/abyss/core
ARG ABYSS_DEV=http://mirror.abyss.run/abyss/devel
RUN echo $ABYSS_CORE > /etc/apk/repositories
RUN echo $ABYSS_DEV >> /etc/apk/repositories
RUN apk add --no-cache abyss-base-dev
RUN ln -s /usr/bin/gmake /usr/bin/make
RUN toolchain none llvm
RUN adduser root abuild
COPY ./run.sh /
COPY ./abuild.conf /root/.abuild/
ENTRYPOINT ["/run.sh"]
CMD ["/usr/bin/ash", "--login"]
