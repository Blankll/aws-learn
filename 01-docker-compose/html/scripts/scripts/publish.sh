#!/bin/bash -eu
cd $(dirname $0)/..

IMAGE=$(ACCOUNT_ID=${ACCOUNT_ID}./scripts/package.sh | grep "image:" | awk -F ': ' '{ printf("%s", $2)}')
REPOSITORY=$(echo $IMAGE | awk -F ':' '{ printf("%s", $1) }')
VERSION=$(echo $IMAGE | awk -F ':' '{ printf("%s", $2) }')

docker tag "${REPOSITORY}:${VERSION}" "${REPOSITORY}:latest"
AWS_PROFILE=beach docker push "${REPOSITORY}:${VERSION}"

DIGEST=$(AWS_PROFILE=beach docker push "${REPOSITORY}:latest" | grep "digest:" | awk -F ' ' '{ printf("%s", $3) }')

echo "${REPOSITORY}:${VERSION}@${DIGEST}" | tee artifacts/docker-image.txt
