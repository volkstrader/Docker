# go-node-aws

## Build
```
docker build --no-cache -t go-node-aws-bc --build-arg AWS_KEY=<KEY> --build-arg AWS_SECRET=<SECRET> --build-arg AWS_REGION=<REGION> .
```

## Run
```
docker run -it --rm go-node-aws-bc /bin/bash
```