#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`

echo "tests"
export DJANGO_SETTINGS_MODULE={{ project_name }}.testsettings
$ROOT/venv.sh src/manage.py test $@

echo "code checks"
$ROOT/venv.sh flake8 $ROOT/src --show-source
