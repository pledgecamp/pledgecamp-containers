FROM debian:stable

ENV SOURCE_DIR /src
ENV CYPRESS_VERSION 3.8.2
USER root

# allow installing when the main user is root
ENV npm_config_unsafe_perm true
# "fake" dbus address to prevent errors
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
# avoid million NPM install messages
ENV npm_config_loglevel warn

RUN apt-get update \
&& apt-get upgrade --quiet -y \
&& apt-get install --quiet -y \
  build-essential \
  wget \
&& wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
&& apt-get update \
&& apt-get install  --quiet -y \
  curl \
  dbus-x11 \
  git \
  google-chrome-stable \
  libgtk2.0-0 \
  libgtk-3-0 \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  nginx \
  unzip \
  xvfb \
  xauth \
  zip \
&& curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh \
&& bash ./nodesource_setup.sh \
&& apt-get install -y nodejs \
&& npm -v && nodejs -v \
&& npm i -g cypress@"${CYPRESS_VERSION}"

EXPOSE 80
EXPOSE 8080
WORKDIR ${SOURCE_DIR}

COPY nginx.conf /etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]
