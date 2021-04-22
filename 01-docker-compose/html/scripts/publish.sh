#!/bin/bash -eu
cd $(dirname $0)/..

IMAGE=$(./scripts/package.sh | grep "image:" | awk -F ': ' '{ printf("%s", $2)}')
REPOSITORY=$(echo $IMAGE | awk -F ':' '{ printf("%s", $1) }')
VERSION=$(echo $IMAGE | awk -F ':' '{ printf("%s", $2) }')

docker tag "${REPOSITORY}:${VERSION}" "${REPOSITORY}:latest"
docker push "${REPOSITORY}:${VERSION}"

DIGEST=$(docker push "${REPOSITORY}:latest" | grep "digest:" | awk -F ' ' '{ printf("%s", $3) }')

echo "${REPOSITORY}:${VERSION}@${DIGEST}" | tee artifacts/docker-image.txt
