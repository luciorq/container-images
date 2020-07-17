# BASE IMAGE
FROM ubuntu:20.04


# Reference: http://www.htslib.org/download/
# Variables
# ENV SAMTOOLS_VERSION 1.10
# ENV BCFTOOLS_VERSION 1.10.2
# ENV HTSLIB_VERSION 1.10.2
# https://github.com/samtools/samtools/releases/download/
# https://github.com/samtools/bcftools/releases/download/
# https://github.com/samtools/htslib/releases/download/

ARG BUILD_VERSION
ENV HTSLIB_VERSION 1.10.2
ENV BCFTOOLS_VERSION 1.10.2
ENV SAMTOOLS_VERSION=$BUILD_VERSION

ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
    wget \
    tar \
    gcc \
    g++ \
    make \
    autoconf \
    automake \
    perl \
    libz-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libncurses-dev \
    libssl-dev \
    libcurl4-gnutls-dev \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# build HTSlib
RUN wget --no-check-certificate \
  https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 \
  && tar -xvf htslib-${HTSLIB_VERSION}.tar.bz2 \
  && mv htslib-${HTSLIB_VERSION} /usr/local/htslib \
  && rm htslib-${HTSLIB_VERSION}.tar.bz2 \
  && cd /usr/local/htslib \
  && ./configure --prefix=/usr/local \
  && make \
  && make install

# Build SAMtools
RUN wget --no-check-certificate https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 \
  && tar -xvf samtools-${SAMTOOLS_VERSION}.tar.bz2 \
  && mv samtools-${SAMTOOLS_VERSION} /usr/local/samtools \
  && rm samtools-${SAMTOOLS_VERSION}.tar.bz2 \
  && cd /usr/local/samtools \
  && ./configure --prefix=/usr/local \
  && make \
  && make install

# Build BCFtools
RUN wget --no-check-certificate https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 \
  && tar -xvf bcftools-${BCFTOOLS_VERSION}.tar.bz2 \
  && mv bcftools-${BCFTOOLS_VERSION} /usr/local/bcftools \
  && rm bcftools-${BCFTOOLS_VERSION}.tar.bz2 \
  && cd /usr/local/bcftools \
  && ./configure --prefix=/usr/local \
  && make \
  && make install


# RUN yum install -y zlib-devel \
#                    ncurses-devel ; \
#     yum clean all ; \
#     curl -L -o htslib-$VERSION.tar.gz https://github.com/samtools/htslib/archive/$VERSION.tar.gz ; \
#     curl -L -o samtools-$VERSION.tar.gz https://github.com/samtools/samtools/archive/$VERSION.tar.gz ; \
#     curl -L -o bcftools-$VERSION.tar.gz https://github.com/samtools/bcftools/archive/$VERSION.tar.gz ; \
#     tar xzf bcftools-$VERSION.tar.gz ; \
#     tar xzf htslib-$VERSION.tar.gz ; \
#     tar xzf samtools-$VERSION.tar.gz ; \
#     rm -rf bcftools-$VERSION.tar.gz ; \
#     rm -rf htslib-$VERSION.tar.gz ; \
#     rm -rf samtools-$VERSION.tar.gz ; \
#     mv htslib-$VERSION htslib ; \
#     cd bcftools-$VERSION ; \
#     make -j HTSDIR=../htslib ; \
#     make prefix=$APPS/bcftools/$VERSION install ; \
#     cd .. ; \
#     cd samtools-$VERSION ; \
#     make -j HTSDIR=../htslib ; \
#     make prefix=$APPS/$APP_NAME/$VERSION install ; \
#     cd ../ ; \
#     rm -rf htslib samtools-$VERSION bcftools-$VERSION

