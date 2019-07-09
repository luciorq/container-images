# BASE IMAGE
FROM ubuntu:18.04

# Variables
ARG BUILD_VERSION
ENV BOWTIE_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
  wget \
  make \
  libtbb-dev \
  unzip \
  perl \
  python \
  python3 \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN wget --no-check-certificate https://github.com/BenLangmead/bowtie2/releases/download/v${BOWTIE_VERSION}/bowtie2-${BOWTIE_VERSION}-sra-linux-x86_64.zip \
  && unzip bowtie2-${BOWTIE_VERSION}-sra-linux-x86_64.zip \
  && mv bowtie2-${BOWTIE_VERSION}-sra-linux-x86_64 bowtie2 \
  && rm bowtie2-${BOWTIE_VERSION}-sra-linux-x86_64.zip

ENV PATH="/bowtie2:${PATH}"

# RUN echo $PATH

# RUN bowtie2 --help

CMD ["bowtie2"]
