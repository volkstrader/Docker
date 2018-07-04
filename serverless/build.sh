#!/bin/bash
docker build --no-cache -t serverless \
  --build-arg AWS_KEY=$AWS_KEY \
  --build-arg AWS_SECRET=$AWS_SECRET \
  --build-arg AWS_REGION=$AWS_REGION .

