FROM ubuntu:bionic

ENV SOURCE_DIR /src

RUN apt-get update \
&& apt-get upgrade --quiet -y \
&& apt-get install --quiet -y \
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

EXPOSE 80
EXPOSE 8080
WORKDIR ${SOURCE_DIR}

COPY nginx.conf /etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]
