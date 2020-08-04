# BASE IMAGE
FROM ubuntu:20.04

# Variables
ARG BUILD_VERSION
ENV MINIMAP2_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
    wget \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/


RUN wget --no-check-certificate \
   --output-document minimap2.tar.bz2 \
   https://github.com/lh3/minimap2/releases/download/v2.17/minimap2-${MINIMAP2_VERSION}_x64-linux.tar.bz2 \
  && tar -xvf minimap2.tar.bz2 \
  && rm minimap2.tar.bz2 \
  && mv minimap2-${MINIMAP2_VERSION}_x64-linux /usr/local/minimap2

ENV PATH="/usr/local/minimap2:${PATH}"

RUN echo "export PATH=$PATH" >> /etc/environment

ENTRYPOINT ["minimap2"]
