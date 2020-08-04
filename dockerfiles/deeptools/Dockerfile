# BASE IMAGE
FROM ubuntu:20.04

# Variables
ARG BUILD_VERSION
ENV DEEPTOOLS_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
    wget \
    gcc \
    g++ \
    make \
    cmake \
    unzip \
    python \
    python-dev \
    python3-pip \
    python3-dev \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# install pip
RUN pip3 install \
  numpy \
  scipy \
  py2bit \
  pyBigWig \
  pysam \
  matplotlib \
  deeptools

RUN wget --no-check-certificate \
  --output-document deeptools-master.zip \
  https://github.com/deeptools/deepTools/archive/master.zip \
  && unzip deeptools-master.zip \
  && rm deeptools-master.zip \
  && mv deepTools-master /usr/local/deeptools

RUN cd /usr/local/deeptools \
  && python3 setup.py install --prefix /usr/local
