# BASE IMAGE
FROM ubuntu:20.04

# Variables
ARG BUILD_VERSION
ENV IMAGE_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
  ipmitool \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# Executable
ENTRYPOINT ["/usr/bin/ipmitool"]

# Default parameter
CMD ["--help"]
