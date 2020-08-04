# BASE IMAGE
FROM ubuntu:20.04

# set default shell
SHELL [ "/bin/bash", "--login", "-c" ]

# Variables
ARG BUILD_VERSION
ENV RMATS_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive


# Installation
RUN set -e \
  && apt-get -y update \
  && apt-get -y install --no-install-recommends \
  --no-install-suggests \
    wget \
    libblas-dev \
    liblapack-dev \
    libgsl-dev \
    zlib1g-dev \
    gfortran \
    gcc \
    make \
    cmake \
    python \
    python3-pip \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# install pip
RUN pip install --upgrade pip

# # install miniconda
# ENV MINICONDA_VERSION 4.8.2
# ENV CONDA_DIR $HOME/miniconda3
# RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-$MINICONDA_VERSION-Linux-x86_64.sh -O ~/miniconda.sh && \
#     chmod +x ~/miniconda.sh && \
#     ~/miniconda.sh -b -p $CONDA_DIR && \
#     rm ~/miniconda.sh
# RUN wget --no-check-certificate \
#   --output-document sratoolkit.tar.gz \
#   http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz \
#   && tar -xzf sratoolkit.tar.gz \
#   && rm sratoolkit.tar.gz \
#   && mv sratoolkit.*-ubuntu64 sratoolkit
# 
#cd /usr/local
# https://github.com/Xinglab/rmats-turbo/releases/download/v4.1.0/rmats_turbo_v4_1_0.tar.gz
#https://github.com/Xinglab/rmats-turbo/releases/download/v4.1.0/rmats_turbo_v${RMATS_VERSION}.tar.gz
#git clone https://github.com/Xinglab/rmats-turbo.git
