FROM registry.gitlab.com/abyssos/abyss-docker/abyss:latest
RUN apk add --no-cache abuild clang gmake gtar lld llvm-binutils llvm-dev musl-dev toolchain
RUN ln -s /usr/bin/gmake /usr/bin/make
RUN toolchain none llvm
RUN adduser -D -h /home/buildozer buildozer
RUN adduser buildozer abuild
COPY ./run.sh /
COPY ./abuild.conf /home/buildozer/.abuild/
RUN chown buildozer:buildozer -R /home/buildozer
USER buildozer
ENTRYPOINT ["/run.sh"]
CMD ["/usr/bin/ash", "--login"]
