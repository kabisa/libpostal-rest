#!/usr/bin/env bash
set -e

curl https://golang.org/dl/go1.15.3.darwin-amd64.tar.gz > go1.15.3.darwin-amd64.tar.gz

echo "2e045043a28a2834e10edeb64c0cffd080a3525016fab1898d5624b57312a698  go1.15.3.darwin-amd64.tar.gz" | sha256sum -c

tar xzf go1.15.3.darwin-amd64.tar.gz

export GOROOT=/libpostal/go
export GOPATH=/libpostal/workspace
export PATH=$PATH:/libpostal/go/bin

go install
