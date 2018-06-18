docker build --no-cache -t aws-serverless:latest ^
  --build-arg AWS_KEY=%AWS_KEY% ^
  --build-arg AWS_SECRET=%AWS_SECRET% ^
  --build-arg AWS_REGION=%AWS_REGION% .