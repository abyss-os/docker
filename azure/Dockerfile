FROM abyssos/abyss:latest
RUN apk update
RUN apk upgrade -a
RUN apk add --no-cache abyss-base-dev nodejs shadow
RUN ln -s /usr/bin/gmake /usr/bin/make
RUN toolchain none llvm
RUN adduser root abuild
LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/bin/node"
COPY ./abuild.conf /root/.abuild/
RUN abuild-keygen -ain
CMD [ "node" ]
