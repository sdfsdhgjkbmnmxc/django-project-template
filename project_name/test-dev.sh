#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
$ROOT/system/venv.sh

pep8 $ROOT/src --show-source
export DJANGO_SETTINGS_MODULE={{ project_name }}.testsettings
$ROOT/src/manage.py test $@
