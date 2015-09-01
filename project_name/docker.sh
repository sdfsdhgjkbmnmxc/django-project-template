#!/bin/bash
ROOT=`pwd`/`dirname "$0"`
WORKDIR=/var/www/project_name
docker run -ti \
    -v ${ROOT}/src:${WORKDIR}/src \
     project_name \
     ${@:-bash}
