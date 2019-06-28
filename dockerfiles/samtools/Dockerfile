# BASE IMAGE
FROM ubuntu:18.04


# Reference: http://www.htslib.org/download/
# Variables
# ENV SAM_VERSION 1.9
# ENV BCF_VERSION 1.9
# ENV HTS_VERSION 1.9

ARG BUILD_VERSION
ENV SAM_VERSION=$BUILD_VERSION

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
  zlib1g-dev \
  libbz2-dev \
  liblzma-dev \
  libncurses-dev \
  make \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# https://github.com/samtools/htslib/releases/download/${HTS_VERSION}/htslib-${HTS_VERSION}.tar.bz2
# https://github.com/samtools/bcftools/releases/download/${BCF_VERSION}/bcftools-${BCF_VERSION}.tar.bz2


RUN wget --no-check-certificate https://github.com/samtools/samtools/releases/download/${SAM_VERSION}/samtools-${SAM_VERSION}.tar.bz2 \
  && tar -xjf samtools-${SAM_VERSION}.tar.bz2 \
  && mv samtools-${SAM_VERSION} samtools \
  && cd samtools \
  && ./configure \
  && make \
  && make install \
  && rm /samtools-${SAM_VERSION}.tar.bz2


#
# ENV APP_NAME=samtools
# ENV VERSION=1.1
# ENV GIT=https://github.com/BenLangmead/samtools.git
# ENV APPS=/software/applications
# ENV DEST=$APPS/$APP_NAME/
# ENV PATH=$APPS/$APP_NAME/$VERSION/bin:$APPS/bcftools/$VERSION/bin:$PATH
#
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
#
# CMD ["/bin/bash"]


# # ENV PATH=$PATH:/samtools/bin

# # Set working directory
# ENV PATH=$PATH:/sratoolkit/bin
# ENV HOME=/data
# WORKDIR /data

# Executable
# ENTRYPOINT ["/usr/local/sra-tools"]

# Default parameter
# CMD ["--help"]

