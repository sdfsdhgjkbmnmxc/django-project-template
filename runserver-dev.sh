#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
export DJANGO_SETTINGS_MODULE={{ project_name }}.localsettings
$ROOT/system/venv.sh src/manage.py syncdb
$ROOT/system/venv.sh src/manage.py runserver
