FROM ubuntu:focal

ENV SOURCE_DIR /src
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y \
  curl \
  gcc \
  g++ \
  golang && \
ln -fs /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime && \
dpkg-reconfigure --frontend noninteractive tzdata

# Adding GO paths to environment
ENV PATH "$PATH:/usr/local/go/bin"
ENV GOPATH "/usr/local/go"
ENV GOHOME "$GOPATH"

WORKDIR ${SOURCE_DIR}
