# Declared arguments
ARG app_version=current
ARG os_version=22.04
# BASE IMAGE
FROM ubuntu:"${os_version}"

# Variables
ENV APP_VERSION="${app_version}"
ENV DEBIAN_FRONTEND noninteractive

# Installation
RUN set -e \
  && apt -y update \
  && apt -y install \
    --no-install-recommends \
    --no-install-suggests \
    wget \
    libxml-libxml-perl \
  && apt -y autoremove \
  && apt clean \
  && rm -rf /var/lib/apt/lists/

RUN mkdir -p /opt/apps \
  && wget --no-check-certificate \
    -L -nv -q \
    --output-document /opt/apps/sratoolkit.tar.gz \
    https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${APP_VERSION}/sratoolkit.${APP_VERSION}-ubuntu64.tar.gz \
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
RUN vdb-config --interactive --interactive-mode textual

# Executable
# ENTRYPOINT ["/usr/local/sra-tools"]

# Default parameter
# CMD ["--help"]
