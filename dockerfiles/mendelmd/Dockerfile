# BASE IMAGE
FROM ubuntu:20.04

# Variables
ARG BUILD_VERSION
ENV MENDELMD_VERSION=$BUILD_VERSION
ENV DEBIAN_FRONTEND noninteractive

# Send logs strait to output
ENV PYTHONUNBUFFERED 1

RUN set -e \
  && apt-get -y update \
  && apt-get -y install \
  --no-install-recommends \
  --no-install-suggests \
  apt-utils \
  libterm-readline-gnu-perl \
  bcftools \
  build-essential \
  ca-certificates \
  cpanminus \
  curl \
  gcc \
  git \
  libbz2-dev \
  libcgi-session-perl \
  libcurl4-openssl-dev \
  libffi-dev \
  liblocal-lib-perl \
  liblzma-dev \
  libpq-dev \
  libssl-dev \
  libxml2-dev \
  make \
  pkg-config \
  python-dev \
  python-lxml \
  python \
  python-dev \
  python3 \
  python3-dev \
  python3-pip \
  python3-setuptools \
  python3-venv \
  rabbitmq-server \
  dh-python \
  python3-wheel \
  software-properties-common \
  sudo \
  tabix \
  unzip \
  vcftools \
  virtualenvwrapper \
  wget \
  zip \
  zlib1g \
  zlib1g-dev \
  zlibc \
  locales \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# install pip
RUN pip3 install --upgrade pip
RUN wget --no-check-certificate \
  https://bootstrap.pypa.io/get-pip.py \
  && python2 get-pip.py

RUN pip3 install \
  setuptools \
  wheel \
  statistics

RUN pip install \
  statistics

#RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN wget --no-check-certificate \
  https://github.com/raonyguimaraes/mendelmd/archive/master.tar.gz \
  && tar -xzf master.tar.gz \
  && rm master.tar.gz \
  && mv mendelmd-master mendelmd

# WORKDIR /mendelmd

RUN pip3 install -r /mendelmd/requirements.txt

# #RUN pip3 install pynnotator
RUN cd /mendelmd \
  && wget --no-check-certificate \
  https://github.com/raonyguimaraes/pynnotator/archive/master.tar.gz \
  && tar -xzf master.tar.gz \
  && rm master.tar.gz \
  && mv pynnotator-master pynnotator

RUN cd /mendelmd/pynnotator \
  && python3 setup.py install

# VOLUME /data/mendel/mendelmd/compose/data /usr/local/lib/python3.6/dist -packages/pynnotator/data

RUN pynnotator install_docker
