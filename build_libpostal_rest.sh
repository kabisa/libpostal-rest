#!/usr/bin/env bash
set -e


GOPLATFORM="${BUILDPLATFORM//\//-}"

echo "GOPLATFORM: $GOPLATFORM"

curl "https://dl.google.com/go/go1.15.3.$GOPLATFORM.tar.gz" > "go1.15.3.$GOPLATFORM.tar.gz"

GOTARHASH=""
case $GOPLATFORM in
  "linux-arm64")
    GOTARHASH="b8b88a87ada918ef5189fa5938ef4c46a4f61952a34317612aaac705f4275f80"
    ;;
  "linux-amd64")
    GOTARHASH="010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d"
    ;;
esac

echo "GOTARHASH: $GOTARHASH"

echo "$GOTARHASH  go1.15.3.$GOPLATFORM.tar.gz" | sha256sum -c

tar xzf "go1.15.3.$GOPLATFORM.tar.gz"

export GOROOT=/libpostal/go
export GOPATH=/libpostal/workspace
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

go get
go install

mv $GOBIN/libpostal $GOBIN/libpostal-rest