FROM ubuntu:focal

ENV HUGO_VERSION 0.70.0
ENV SOURCE_DIR /src
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y \
  curl \
  gcc \
  g++ \
  golang

# Adding GO paths to environment
ENV PATH "$PATH:/usr/local/go/bin"
ENV GOPATH "/usr/local/go"
ENV GOHOME "$GOPATH"

WORKDIR /tmp
# Install Hugo Static Site Generator
RUN \
ln -fs /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime && \
dpkg-reconfigure --frontend noninteractive tzdata && \
curl -sL https://github.com/gohugoio/hugo/archive/v${HUGO_VERSION}.tar.gz -o hugo.tar.gz && \
tar xvf hugo.tar.gz && \
cd hugo-${HUGO_VERSION} && \
go install --tags extended && \
rm -R /tmp/hugo-${HUGO_VERSION}

WORKDIR ${SOURCE_DIR}
CMD ["hugo", "server", "-D"]
