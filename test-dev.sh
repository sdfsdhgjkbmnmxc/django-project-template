#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
$ROOT/venv.sh pep8 $ROOT/src --show-source
$ROOT/venv.sh flake8 $ROOT/src --show-source
export DJANGO_SETTINGS_MODULE={{ project_name }}.testsettings
$ROOT/venv.sh src/manage.py test $@
