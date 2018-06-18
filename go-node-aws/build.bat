docker build --no-cache -t go-node-aws-bc --build-arg AWS_KEY=%AWS_ACCESS_KEY_ID% --build-arg AWS_SECRET=%AWS_SECRET_ACCESS_KEY% --build-arg AWS_REGION=%AWS_DEFAULT_REGION% .
