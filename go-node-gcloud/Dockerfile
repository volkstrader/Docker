FROM go-bionic:1.10.3

# Install Google Cloud SDK
RUN export CLOUD_SDK_REPO="cloud-sdk-$(sed -n 's/VERSION=\"\S* (\(\w*\))\"/\1/p' /etc/os-release)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y && apt-get install google-cloud-sdk-app-engine-go -y

RUN npm install -g create-react-app && npm install -g firebase-tools 
