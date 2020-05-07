FROM pledgecamp/golang

ENV HUGO_VERSION 0.70.0

WORKDIR /tmp
# Install Hugo Static Site Generator
RUN \
curl -sL https://github.com/gohugoio/hugo/archive/v${HUGO_VERSION}.tar.gz -o hugo.tar.gz && \
tar xvf hugo.tar.gz && \
cd hugo-${HUGO_VERSION} && \
go install --tags extended && \
rm -R /tmp/hugo-${HUGO_VERSION}

WORKDIR ${SOURCE_DIR}
CMD ["hugo", "server", "-D"]
