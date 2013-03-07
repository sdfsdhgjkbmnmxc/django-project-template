#!/bin/sh
ROOT=`dirname "${BASH_SOURCE[0]}"`

export HOST=`cat ${ROOT}/system/host.conf`
sed -i 's/YOUR\.DOMAIN/${HOST}/g' ${ROOT}/system/*

${ROOT}/system/_deploy-dev.sh
