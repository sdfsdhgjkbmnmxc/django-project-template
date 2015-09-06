#!/bin/bash
set -e
ROOT=`dirname $0`

source ${ROOT}/../system/venv/bin/activate
exec ${ROOT}/manage.py $@
