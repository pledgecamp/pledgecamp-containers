FROM ubuntu:bionic

ENV SOURCE_DIR /src

LABEL maintainer="contact@simonball.me" \
      description="A simple Python3 environment in Ubuntu"

# Set locale environment variables
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update && apt-get upgrade --quiet -y && apt-get install --fix-missing --quiet -y \
  git \
  python3-pip \
  python3-dev \
&& \
pip3 install \
  pipenv

WORKDIR ${SOURCE_DIR}
