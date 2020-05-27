# BASE IMAGE
FROM ubuntu:20.04

# Variables
ARG BUILD_VERSION
ENV SRA_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
  wget \
  libmagic-dev \
  libxml2 \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/


RUN wget --no-check-certificate --output-document sratoolkit.tar.gz http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz \
  && tar -xzf sratoolkit.tar.gz \
  && rm sratoolkit.tar.gz \
  && mv sratoolkit.*-ubuntu64 sratoolkit


# Set working directory
ENV PATH=$PATH:/sratoolkit/bin
ENV HOME=/data
WORKDIR /data

# Executable
# ENTRYPOINT ["/usr/local/sra-tools"]

# Default parameter
# CMD ["--help"]
