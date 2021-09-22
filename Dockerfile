# syntax=docker/dockerfile:1.3

FROM ubuntu:20.04

LABEL maintainer="Rakesh Sukumar <rakesh.melezhath@gmail.com>" \
    image_type="nbdev document viewer"

# Change the default shell to /bin/bash from /bin/sh
SHELL ["/bin/bash", "--login", "-c"]

# Set Timezone & DEBIAN_FRONTEND for installing tzdata
# & pkg-config non-interactively
ARG TZ="Asia/Kolkata" DEBIAN_FRONTEND=noninteractive
# Set TZ as an environment variable
ENV TZ=$TZ

RUN apt-get update \
    && apt-get -y upgrade \
    && apt install -y \
    build-essential \
    bzip2 \
    ca-certificates \
    curl \
    htop \
    tzdata \
    # Correct TimeZone
    && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt install -y \
    pkg-config \
    tree \
    unrar \
    unzip \
    wget \
    ruby-full \
    zlib1g-dev \
    && gem install jekyll bundler

# Expose 4000 port for Jekyll
EXPOSE 4000

# Copy start.sh
COPY start.sh .

# We will mount the project repository to /repo in docker
WORKDIR /repo/docs

# The documentation will be available in localhost
CMD ["/start.sh"]
