FROM abyssos/abyss:latest
RUN apk add --no-cache abyss-base-dev
RUN ln -s /usr/bin/gmake /usr/bin/make
RUN toolchain none llvm
RUN adduser root abuild
COPY ./run.sh /
COPY ./abuild.conf /root/.abuild/
ENTRYPOINT ["/run.sh"]
CMD ["/usr/bin/ash", "--login"]
