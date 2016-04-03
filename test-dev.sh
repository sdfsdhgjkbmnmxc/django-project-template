#!/bin/bash
set -e
cd `dirname $0`

echo "tests"
DJANGO_SETTINGS_MODULE=`cat system/name.conf`.testsettings \
    .venv/bin/python3 src/manage.py test $@

echo "code checks"
.venv/bin/flake8 src --show-source
