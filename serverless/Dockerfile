FROM node:carbon

ARG AWS_KEY
ARG AWS_SECRET

# update node environment and install node apps
USER node
RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
RUN npm i npm@latest -g && npm install -g rimraf && npm install -g serverless


# Copy from https://github.com/docker-library/golang/blob/329b6672949337c4469351b2e8b8575459a75c7f/1.10/stretch/Dockerfile of https://hub.docker.com/_/golang/ 
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
	&& rm -rf /var/lib/apt/lists/*

ENV GOLANG_VERSION 1.10.2

RUN set -eux; \
	\
# this "case" statement is generated via "update.sh"
	dpkgArch="$(dpkg --print-architecture)"; \
	case "${dpkgArch##*-}" in \
		amd64) goRelArch='linux-amd64'; goRelSha256='4b677d698c65370afa33757b6954ade60347aaca310ea92a63ed717d7cb0c2ff' ;; \
		armhf) goRelArch='linux-armv6l'; goRelSha256='529a16b531d4561572db6ba9d357215b58a1953437a63e76dc0c597be9e25dd2' ;; \
		arm64) goRelArch='linux-arm64'; goRelSha256='d6af66c71b12d63c754d5bf49c3007dc1c9821eb1a945118bfd5a539a327c4c8' ;; \
		i386) goRelArch='linux-386'; goRelSha256='ea4caddf76b86ed5d101a61bc9a273be5b24d81f0567270bb4d5beaaded9b567' ;; \
		ppc64el) goRelArch='linux-ppc64le'; goRelSha256='f0748502c90e9784b6368937f1d157913d18acdae72ac75add50e5c0c9efc85c' ;; \
		s390x) goRelArch='linux-s390x'; goRelSha256='2266b7ebdbca13c21a1f6039c9f6887cd2c01617d1e2716ff4595307a0da1d46' ;; \
		*) goRelArch='src'; goRelSha256='6264609c6b9cd8ed8e02ca84605d727ce1898d74efa79841660b2e3e985a98bd'; \
			echo >&2; echo >&2 "warning: current architecture ($dpkgArch) does not have a corresponding Go binary release; will be building from source"; echo >&2 ;; \
	esac; \
	\
	url="https://golang.org/dl/go${GOLANG_VERSION}.${goRelArch}.tar.gz"; \
	wget -O go.tgz "$url"; \
	echo "${goRelSha256} *go.tgz" | sha256sum -c -; \
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	\
	if [ "$goRelArch" = 'src' ]; then \
		echo >&2; \
		echo >&2 'error: UNIMPLEMENTED'; \
		echo >&2 'TODO install golang-any from jessie-backports for GOROOT_BOOTSTRAP (and uninstall after build)'; \
		echo >&2; \
		exit 1; \
	fi; \
	\
	export PATH="/usr/local/go/bin:$PATH"; \
	go version

# Install Google Cloud SDK
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y && apt-get install google-cloud-sdk-app-engine-go -y && \
	gcloud components install app-engine-go

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV PATH=/root/.local/bin:$PATH
ENV AWS_ACCESS_KEY_ID=$AWS_KEY
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET
ENV AWS_DEFAULT_REGION=us-west-2

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" && mkdir /root/.ssh && chmod 600 /root/.ssh && cd /root
RUN echo "Host github.com\n\tHostName github.com\n\tUser git\n\tIdentityFile ~/.ssh/github.com" > /root/.ssh/config
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | bin/bash
RUN curl -O https://bootstrap.pypa.io/get-pip.py | /bin/bash
RUN apt-get update && apt-get install -y python-dev && apt-get install -y groff
RUN python get-pip.py --user && \
    pip install awscli --upgrade --user && \
    sls config credentials --provider aws --key $AWS_KEY --secret $AWS_SECRET
WORKDIR $GOPATH