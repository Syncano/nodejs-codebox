FROM alpine:3.6
ENV version 0.1.100
RUN apk --no-cache add ca-certificates wget fuse fuse-dev alpine-sdk zlib-dev lzo-dev lz4-dev xz-dev
RUN wget https://github.com/vasi/squashfuse/releases/download/${version}/squashfuse-${version}.tar.gz
RUN tar zxf squashfuse-${version}.tar.gz
WORKDIR /squashfuse-${version}
RUN ./configure
RUN make install

FROM node:8-alpine
RUN apk --no-cache add fuse zlib lzo lz4 xz
COPY --from=0 /usr/local/bin/squashfuse /usr/local/bin/squashfuse
