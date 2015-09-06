#!/bin/bash
set -e
ROOT=`dirname $0`
NAME=`cat ${ROOT}/system/name.conf`

source ${ROOT}/venv.sh

echo "tests"
export DJANGO_SETTINGS_MODULE=${NAME}.testsettings
${ROOT}/src/manage.py test $@

echo "code checks"
flake8 ${ROOT}/src --show-source
