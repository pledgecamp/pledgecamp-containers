FROM alpine:3.9

ENV HUGO_VERSION 0.55.4
ENV SOURCE_DIR /src

# Supporting packages
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --update add \
    curl \
    g++ \
    gcc \
    git \
    go \
    libc-dev \
    make \
    musl-dev \
    nodejs \
    npm \
    openssh && \
    npm i -g postcss-cli

# Adding GO paths to environment
ENV PATH "$PATH:$HOME/go/bin"
ENV GOPATH "$HOME/go"
ENV GOHOME "$GOPATH"

# Install Hugo Static Site Generator
WORKDIR /tmp
RUN git clone --single-branch --branch release-${HUGO_VERSION} https://github.com/gohugoio/hugo.git && \
  cd hugo && \
  go install --tags extended \
  && rm -R /tmp/release-${HUGO_VERSION}

WORKDIR ${SOURCE_DIR}
CMD ["hugo", "server", "-D"]
