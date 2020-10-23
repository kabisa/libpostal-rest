#!/usr/bin/env bash
set -e

curl https://dl.google.com/go/go1.15.3.linux-amd64.tar.gz > go1.15.3.linux-amd64.tar.gz

echo "010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d  go1.15.3.linux-amd64.tar.gz" | sha256sum -c

tar xzf go1.15.3.linux-amd64.tar.gz

export GOROOT=/libpostal/go
export GOPATH=/libpostal/workspace
export GOBIN=$GOPATH/bin
export PATH=$PATH:/libpostal/go/bin

go get
go install

mv $GOBIN/libpostal $GOBIN/libpostal-rest