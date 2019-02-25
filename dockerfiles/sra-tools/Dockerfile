# BASE IMAGE
FROM ubuntu:18.04

# Variables
ENV DEBIAN_FRONTEND noninteractive
ENV SRA_VERSION 2.9.4

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
  && mv sratoolkit.${SRA_VERSION}-ubuntu64 sratoolkit


# Set working directory
ENV PATH=$PATH:/sratoolkit/bin
ENV HOME=/data
WORKDIR /data

# Executable
# ENTRYPOINT ["/usr/local/sra-tools"]

# Default parameter
# CMD ["--help"]
