#BASE IMAGE
FROM ubuntu:20.04

# Variables
ARG BUILD_VERSION
ENV FASTQC_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
    wget \
    unzip \
    default-jre \
    libfindbin-libs-perl \
    locales \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN wget --no-check-certificate \
  --output-document /tmp/fastqc.zip \
  https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VERSION}.zip \
  && unzip /tmp/fastqc.zip -d /usr/local/  \
  && rm /tmp/fastqc.zip \
  && chmod a+x /usr/local/FastQC/fastqc \
  && ln -s /usr/local/FastQC/fastqc /usr/local/bin/fastqc

# to remove perl warnings
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Executable
ENTRYPOINT ["/usr/local/bin/fastqc"]

# Default parameter
CMD ["--help"]
