FROM alpine:3.8 as libpostal-build

ENV LIBPOSTAL_COMMIT_HASH="7c22eb4e644d6ef9faf38904ff8d6c712f7a106a"

RUN apk add --no-cache --virtual .build-deps \
        curl \
        git \
        gcc \
        g++ \
        make \
        libtool \
        autoconf \
        automake

RUN git clone https://github.com/openvenues/libpostal

RUN set -ex && cd libpostal/ \
        && mkdir -p /opt/libpostal_data \
        \
        && ./bootstrap.sh \
        && ./configure --prefix=/usr --datadir=/opt/libpostal_data --disable-sse2 \
        \
        && make -j "$(nproc)" \
        && make install

FROM golang:1.15-alpine3.12

ARG TARGETPLATFORM
ARG BUILDPLATFORM

COPY --from=libpostal-build /opt/libpostal_data/ /opt/libpostal_data/
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
