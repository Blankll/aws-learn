#!/bin/bash -eu
if [[ -z $1 ]]
then
        echo 'please add the repository name as first paramter'
        exit 1
fi

aws ecr create-repository \
    --profile beach \
    --repository-name  $1 \
    --region ap-southeast-2
