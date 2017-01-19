FROM debian:jessie
MAINTAINER Jc Miñarro <josecarlos.minarro@gmail.com>

ENV SDKMAN_DIR /usr/local/sdkman

# Install curl, zip and unzip
RUN apt-get update -y && \
    apt-get install -y curl zip unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -s get.sdkman.io | bash

RUN set -x \
    && echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config \
    && echo "sdkman_insecure_ssl=false" >> $SDKMAN_DIR/etc/config

RUN /bin/bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh"