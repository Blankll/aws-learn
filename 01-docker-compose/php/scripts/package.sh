#!/bin/bash -eu

cd $(dirname $0)/..

REPOSITORY="${ACCOUNT_ID}.dkr.ecr.ap-southeast-2.amazonaws.com/training-php"
VERSION=$(TZ=Asia/Shanghai date +'%Y-%m-%d-%H-%M')
docker build -t "${REPOSITORY}:${VERSION}" .

echo -e "build success!\nimage: ${REPOSITORY}:${VERSION}"
