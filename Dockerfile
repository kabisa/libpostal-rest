FROM alpine:3.8 as libpostal-build

ENV LIBPOSTAL_VERSION="1.0.0"
ENV LIBPOSTAL_DOWNLOAD_URL="https://github.com/openvenues/libpostal/archive/v$LIBPOSTAL_VERSION.tar.gz"
ENV LIBPOSTAL_DOWNLOAD_SHA="3035af7e15b2894069753975d953fa15a86d968103913dbf8ce4b8aa26231644"

RUN apk add --no-cache --virtual .build-deps \
        curl \
        gcc \
        g++ \
        make \
        libtool \
        autoconf \
        automake

RUN wget -O libpostal.tar.gz "$LIBPOSTAL_DOWNLOAD_URL" \
        && echo "$LIBPOSTAL_DOWNLOAD_SHA *libpostal.tar.gz" | sha256sum -c - \
        \
        && mkdir -p /src  \
        && mkdir -p /data \
        \
        && tar -xzf libpostal.tar.gz -C /src --strip-components=1 \
        && rm libpostal.tar.gz \
        && cd /src \
        \
        && autoreconf -fi --warning=no-syntax --warning=no-portability \
        && ./configure --prefix=/usr --datadir=/data --disable-sse2 \
        \
        && make -j "$(nproc)" \
        && make install \
        \
        && apk del .build-deps \
        && rm -rf /src

FROM golang:1.15-alpine3.12

ARG TARGETPLATFORM
ARG BUILDPLATFORM

COPY --from=libpostal-build /data /data
COPY --from=libpostal-build /usr/lib/pkgconfig/libpostal.pc /usr/lib/pkgconfig/libpostal.pc
COPY --from=libpostal-build /usr/lib/libpostal.so /usr/lib/libpostal.so
COPY --from=libpostal-build /usr/lib/libpostal.so.1 /usr/lib/libpostal.so.1
COPY --from=libpostal-build /usr/include/libpostal /usr/include/libpostal

RUN apk add --no-cache curl git autoconf automake libtool pkgconfig build-base

COPY main.go /libpostal/

WORKDIR /libpostal

RUN  export GOPATH=/libpostal/workspace \
     && export GOBIN=$GOPATH/bin \
     && export PATH=$PATH:$GOBIN \
     && go get \
     && go build -o $GOBIN/libpostal-rest

EXPOSE 8080

CMD /libpostal/workspace/bin/libpostal-rest
