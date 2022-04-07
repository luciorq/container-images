# BASE IMAGE
FROM ubuntu:20.04

# Variables
ARG BUILD_VERSION
ENV SRA_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install \
    --no-install-recommends \
    --no-install-suggests \
    # wget \
    # libmagic-dev \
    libxml2 \
    libxml-libxml-perl \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/


RUN mkdir -p /opt/apps \
  && wget --no-check-certificate \
    -L -nv -q \
    --output-document /opt/apps/sratoolkit.tar.gz \
    https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz \
  && tar -C /opt/apps/ \
    -xzf /opt/apps/sratoolkit.tar.gz \
  && rm /opt/apps/sratoolkit.tar.gz \
  && mv /opt/apps/sratoolkit.*-ubuntu64 /opt/apps/sratoolkit

RUN for _i in $(ls -A1 /opt/apps/sratoolkit/bin); do ln -sf /opt/apps/sratoolkit/bin/$_i /usr/local/bin/$_i ; done
# Set working directory
# ENV PATH=$PATH:/sratoolkit/bin
# ENV HOME=/data
# WORKDIR /data

# RUN echo "export PATH=$PATH" > /etc/environment

# Executable
# ENTRYPOINT ["/usr/local/sra-tools"]

# Default parameter
# CMD ["--help"]
