FROM ubuntu:focal

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NODE_VERSION v10.20.1
ENV NVM_DIR /root/.nvm

ENV SOURCE_DIR /src
USER root
# allow installing when the main user is root
ENV npm_config_unsafe_perm true
# avoid million NPM install messages
ENV npm_config_loglevel warn

RUN \
mkdir -p $NVM_DIR && \
apt-get update && \
apt-get upgrade --quiet -y && \
apt-get install --quiet -y \
  curl

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
RUN source $NVM_DIR/nvm.sh && \
nvm install $NODE_VERSION && \
nvm alias default $NODE_VERSION && \
nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

WORKDIR /src