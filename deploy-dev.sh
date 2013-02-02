#!/bin/sh
ROOT=`dirname "${BASH_SOURCE[0]}"`

export HOST=mydomain.com
sed -i 's/YOUR\.DOMAIN/${HOST}/g' $ROOT/system/*

$ROOT/system/_deploy-dev.sh
