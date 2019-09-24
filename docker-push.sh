#!/bin/bash
set -e

get_commit_count() {
  git rev-list --all --count
}

source secrets/docker-hub.env
echo "> Logging docker hub with user: ${DOCKER_USERNAME}"

echo "${DOCKER_PASSWORD}" | \
docker login --username="${DOCKER_USERNAME}" --password-stdin

echo "> Pushing image to docker hub..."
docker tag nginx:latest sunzhongmou/nginx:latest
docker push sunzhongmou/nginx:latest

docker tag sunzhongmou/nginx:latest "sunzhongmou/nginx:$(get_commit_count)"
docker push "sunzhongmou/nginx:$(get_commit_count)"