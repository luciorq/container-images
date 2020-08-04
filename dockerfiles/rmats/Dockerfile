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
    git \
    libblas-dev \
    liblapack-dev \
    libgsl-dev \
    zlib1g-dev \
    libgslcblas0 \
    gfortran \
    gcc \
    g++ \
    make \
    cmake \
    python \
    python-dev \
    python3-pip \
    python3-dev \
    r-base \
    r-base-dev \
    libncurses5-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    zlib1g-dev \
    build-essential \
    bedtools \
    libblas-dev \
    liblapack-dev \
    gfortran \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# install pip
RUN pip3 install --upgrade pip
RUN wget --no-check-certificate \
  https://bootstrap.pypa.io/get-pip.py \
  && python2 get-pip.py

RUN pip3 install numpy
RUN pip3 install scipy
RUN pip3 install pysam
RUN pip3 install Cython

RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install scipy
RUN pip install pysam
RUN pip install Cython


RUN wget --no-check-certificate \
   --output-document rmats-turbo.tar.gz \
   https://github.com/Xinglab/rmats-turbo/releases/download/v4.1.0/rmats_turbo_v4_1_0.tar.gz \
  && tar -xzf rmats-turbo.tar.gz \
  && rm rmats-turbo.tar.gz \
  && mv rmats-turbo /usr/local/rmats-turbo


RUN cd /usr/local/rmats-turbo \
  && ./build_rmats

RUN touch ${HOME}/.bashrc

ENV PATH="/usr/local/rmats-turbo:${PATH}"

RUN echo "export PATH=$PATH" >> /etc/environment

ENTRYPOINT ["python", "/usr/local/rmats-turbo/rmats.py"]
