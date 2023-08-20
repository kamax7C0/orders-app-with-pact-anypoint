#!/bin/bash
GIT_COMMIT=$(git rev-parse HEAD)
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
MOCKING_BASE_URL='https://anypoint.mulesoft.com/mocking/api/v1/links/58034f07-b1ed-46e1-9151-cc5bece85bd4'

docker run --platform linux/x86_64 --rm \
 -e PACT_BROKER_BASE_URL \
 -e PACT_BROKER_TOKEN \
  pactfoundation/pact-cli:latest \
  verify \
  --provider-base-url $MOCKING_BASE_URL \
  --provider OrdersAPI \
  --provider-app-version $GIT_COMMIT \
  --provider-version-tag $GIT_BRANCH \
  --publish-verification-results \
  --wait 3