FROM ubuntu:14.04

ENV project_name project_name
RUN mkdir -p /var/www/${project_name}
WORKDIR /var/www/${project_name}
ADD src src

# core
RUN apt-get -y update && apt-get update && apt-get install -y \
    git-core \
    nginx \
    supervisor

# Python requirements
RUN apt-get install -y \
    python-dev \
    python-psycopg2

# Pillow: http://pillow.readthedocs.org/en/latest/installation.html
RUN apt-get install -y \
    libtiff5-dev \
    libjpeg8-dev \
    zlib1g-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libwebp-dev \
    tcl8.6-dev \
    tk8.6-dev \
    python-tk \
    python-imaging
