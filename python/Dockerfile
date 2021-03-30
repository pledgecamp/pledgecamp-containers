FROM ubuntu:focal

ENV SOURCE_DIR /src
ENV PYTHON_VERSION 3.9.1
ENV HOME /root

LABEL maintainer="contact@simonball.me" \
      description="A simple Python3 environment in Ubuntu"

# Set locale environment variables
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Install tools
RUN apt-get update && apt-get upgrade --quiet -y && apt-get install --fix-missing --quiet -y \
  build-essential \
  curl \
  git \
  libffi-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libbz2-dev \
  zlib1g-dev

# Switch default shell to use for RUN commands
SHELL ["/bin/bash", "-c"]
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Setup python
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv \
  && pyenv install $PYTHON_VERSION \
  && pyenv global $PYTHON_VERSION \
  && pip install poetry pipenv

WORKDIR ${SOURCE_DIR}
