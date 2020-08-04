# BASE IMAGE
FROM ubuntu:20.04

# Variables
ARG BUILD_VERSION
ENV ENTREZ_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

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
  curl \
  cpanminus \
  libxml-simple-perl \
  libwww-perl \
  libnet-perl \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/


RUN wget --no-check-certificate ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz \
  && tar -xzf edirect.tar.gz \
  && cpanm HTML::Entities \
  && rm edirect.tar.gz

RUN cd edirect \
  && ./setup.sh

ENV PATH="/edirect:${PATH}"

RUN echo "export PATH=$PATH" >> /etc/environment
