FROM aws-serverless:latest

USER root

# Install Google Cloud SDK
RUN export CLOUD_SDK_REPO="cloud-sdk-$(sed -n 's/VERSION_CODENAME=\([w]*\)/\1/p' /etc/os-release)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl -k https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && apt-get install -y google-cloud-sdk google-cloud-sdk-app-engine-go

# install node firebase and cloud functions
RUN npm install -g firebase-tools && npm install -g serverless-google-cloudfunctions
