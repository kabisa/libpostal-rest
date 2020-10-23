FROM ubuntu:20.04

ARG COMMIT
ENV COMMIT ${COMMIT:-master}
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    autoconf automake build-essential curl git libsnappy-dev libtool pkg-config

RUN git clone https://github.com/openvenues/libpostal -b $COMMIT

COPY ./build_libpostal_rest.sh /libpostal/
COPY ./build_libpostal.sh /libpostal/
COPY main.go /libpostal/

WORKDIR /libpostal
RUN ./build_libpostal.sh
RUN ./build_libpostal_rest.sh

EXPOSE 8080

CMD /libpostal/workspace/bin/libpostal-rest