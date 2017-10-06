FROM node:6-wheezy
ENV version 0.1.100
RUN apt-get update && apt-get install -y libfuse-dev \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/vasi/squashfuse/releases/download/${version}/squashfuse-${version}.tar.gz
RUN tar zxf squashfuse-${version}.tar.gz
WORKDIR /squashfuse-${version}
RUN ./configure
RUN make install

FROM node:6-wheezy
RUN apt-get update && apt-get install -y fuse \
    && rm -rf /var/lib/apt/lists/*
COPY --from=0 /usr/local/bin/squashfuse /usr/local/bin/squashfuse
RUN adduser node fuse
RUN mkdir /env && chown node:node /env
