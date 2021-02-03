#!/bin/sh
IMAGE_NAME=$1

gcloud container images list-tags $IMAGE_NAME --filter='-tags:*' --format='get(digest)' --limit=unlimited \
       | awk -v IMAGE_NAME="$IMAGE_NAME" '{print IMAGE_NAME "@" $1}' \
       | xargs --no-run-if-empty gcloud container images delete --quiet