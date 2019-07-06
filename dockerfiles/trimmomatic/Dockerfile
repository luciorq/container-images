# BASE IMAGE
FROM ubuntu:18.04

# Variables
ARG BUILD_VERSION
ENV STAR_VERSION=$BUILD_VERSION
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
  openjdk-8-jre-headless \
  trimmomatic \
  make \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/



ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/java/trimmomatic.jar"]
