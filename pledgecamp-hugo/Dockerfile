FROM ubuntu:bionic

ENV GO_VERSION 1.13.6
ENV HUGO_VERSION 0.62.2
ENV SOURCE_DIR /src

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y \
  curl \
  gcc \
  g++

# Adding GO paths to environment
ENV PATH "$PATH:/usr/local/go/bin"
ENV GOPATH "/usr/local/go"
ENV GOHOME "$GOPATH"

WORKDIR /tmp
RUN curl -sL https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz -o go.tar.gz \
  && tar -C /usr/local -xzf go.tar.gz

# Install Hugo Static Site Generator

RUN curl -sL https://github.com/gohugoio/hugo/archive/v${HUGO_VERSION}.tar.gz -o hugo.tar.gz \
&& tar xvf hugo.tar.gz \
&& cd hugo-${HUGO_VERSION} \
&& go install --tags extended \
&& rm -R /tmp/hugo-${HUGO_VERSION}

WORKDIR ${SOURCE_DIR}
CMD ["hugo", "server", "-D"]
