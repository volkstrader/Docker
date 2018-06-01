# go-node-serverless

## Build
```
docker build --no-cache -t serverless --build-arg AWS_KEY=<KEY> --build-arg AWS_SECRET=<SECRET> .
```

## Run
```
docker run -it --rm serverless /bin/bash
```