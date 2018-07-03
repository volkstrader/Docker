FROM node-go-bionic:9.11.1

ARG AWS_KEY
ARG AWS_SECRET
ARG AWS_REGION

# Install AWS-Cli
ENV AWS_ACCESS_KEY_ID=$AWS_KEY
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET
ENV AWS_DEFAULT_REGION=$AWS_REGION

USER root
RUN curl -O https://bootstrap.pypa.io/get-pip.py | /bin/bash
RUN apt-get install -y python-dev groff
RUN python get-pip.py --user && \
    pip install awscli --upgrade --user && \
    rm get-pip.py

RUN  npm install -g serverless && sls config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY