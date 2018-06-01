FROM go-node:latest

ARG AWS_KEY
ARG AWS_SECRET
ARG AWS_REGION

# Install AWS-Cli
ENV AWS_ACCESS_KEY_ID=$AWS_KEY
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET
ENV AWS_DEFAULT_REGION=$AWS_REGION

RUN curl -O https://bootstrap.pypa.io/get-pip.py | /bin/bash
RUN apt-get update && apt-get install -y python-dev && apt-get install -y groff
RUN python get-pip.py --user && \
    pip install awscli --upgrade --user 

# Install Google Cloud SDK
RUN export CLOUD_SDK_REPO="cloud-sdk-$(sed -n 's/VERSION=\"\S* (\(\w*\))\"/\1/p' /etc/os-release)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y && apt-get install google-cloud-sdk-app-engine-go -y

# install node apps: reacts, firebase, serverless
USER node
RUN npm install -g create-react-app && npm install -g firebase-tools && npm install -g serverless

USER root
RUN  sls config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY
