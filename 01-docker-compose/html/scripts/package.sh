#!/bin/bash -eu
cd $(dirname $0)/..
REPOSITORY="ghcr.io/blankll/aws-learn"
VERSION=$(TZ=Asia/Shanghai date +'%Y-%m-%d-%H-%M')
docker build -t "${REPOSITORY}:${VERSION}" .

echo -e "build success!\nimage: ${REPOSITORY}:${VERSION}"
