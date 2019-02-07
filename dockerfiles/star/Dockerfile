# BASE IMAGE
FROM ubuntu:18.04

# Variables
ENV DEBIAN_FRONTEND noninteractive
ENV STAR_VERSION 2.7.0a

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
  wget \
  tar \
  g++ \
  gcc \
  libz-dev \
  make \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN wget --no-check-certificate https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz \
  && tar -xzf ${STAR_VERSION}.tar.gz \
  && mv STAR-${STAR_VERSION} STAR


RUN cd STAR/source \
  && make STAR \
  && rm /${STAR_VERSION}.tar.gz

# Executable
ENTRYPOINT ["/STAR/source/STAR"]
