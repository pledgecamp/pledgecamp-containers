FROM ubuntu:bionic

RUN apt-get update && apt-get upgrade --quiet -y && apt-get install --quiet -y \
  build-essential \
  curl \
  git \
  nginx \
  xvfb \
  libgtk-3-dev \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
&& curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh \
&& bash ./nodesource_setup.sh \
&& apt-get install -y nodejs \
&& npm -v && nodejs -v
