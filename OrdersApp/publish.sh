#!/bin/bash
GIT_COMMIT=$(git rev-parse HEAD)
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

docker run --platform linux/x86_64 --rm \
 -w ${PWD} \
 -v ${PWD}:${PWD} \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_TOKEN \
  pactfoundation/pact-cli:latest \
  publish \
  ${PWD}/pacts \
  --consumer-app-version $GIT_COMMIT \
  --tag-with-git-branch