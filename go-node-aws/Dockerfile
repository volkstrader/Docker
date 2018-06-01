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
