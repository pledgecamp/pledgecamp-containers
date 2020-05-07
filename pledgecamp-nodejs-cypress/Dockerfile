FROM pledgecamp/nodejs:latest

ENV CYPRESS_VERSION 4.5.0
ENV DEBIAN_FRONTEND=noninteractive

# "fake" dbus address to prevent errors
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

RUN \
apt-get install --quiet -y \
  build-essential && \
curl -L https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
apt-get update && \
apt-get install  --quiet -y \
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
  zip && \
ln -fs /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime && \
dpkg-reconfigure --frontend noninteractive tzdata
RUN npm i -g cypress@"${CYPRESS_VERSION}"

EXPOSE 80
EXPOSE 8080
WORKDIR ${SOURCE_DIR}

COPY nginx.conf /etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]
