# BASE IMAGE
FROM ubuntu:20.04

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
  libz-dev \
  make \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN wget --no-check-certificate https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz \
  && tar -xzf ${STAR_VERSION}.tar.gz \
  && mv STAR-${STAR_VERSION} /usr/local/STAR


RUN cd /usr/local/STAR/source \
  && make STAR \
  && rm /${STAR_VERSION}.tar.gz \
  && ln -s /usr/local/STAR/bin/Linux_x86_64/STAR /usr/local/bin/STAR


# Set working directory
# ENV HOME=/data
# WORKDIR $HOME

# Executable
ENTRYPOINT ["/usr/local/bin/STAR"]

# Default parameter
CMD ["--help"]
