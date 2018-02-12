FROM node:8-stretch
ENV SQUASHFUSE_VERSION 0.1.101
RUN apt-get update && apt-get install -y libfuse-dev \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/vasi/squashfuse/archive/${SQUASHFUSE_VERSION}.tar.gz -O squashfuse.tar.gz
RUN tar zxf squashfuse.tar.gz
WORKDIR /squashfuse-${SQUASHFUSE_VERSION}
RUN ./autogen.sh && ./configure
RUN make install

FROM node:8-stretch
RUN apt-get update && apt-get install -y fuse \
    && rm -rf /var/lib/apt/lists/*
COPY --from=0 /usr/local/bin/squashfuse /usr/local/bin/squashfuse
RUN mkdir /env && chown node:node /env
