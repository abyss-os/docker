FROM abyssos/abyss:latest
RUN apk add --no-cache clang-dev cmake git gmake libcxx-dev lld llvm-dev musl-dev
RUN [ "/usr/bin/ln", "-s", "/usr/bin/gmake", "/usr/bin/make" ]
RUN [ "/usr/bin/ln", "-s", "/usr/bin/llvm-strip", "/usr/bin/strip" ]
ENV AR=llvm-ar AS='clang' CC='clang' CXX='clang++' LD='ld.lld' \
	CFLAGS='-O2' CXXFLAGS='-O2' CPPFLAGS='-O2'
ENTRYPOINT [ "clang" ]
