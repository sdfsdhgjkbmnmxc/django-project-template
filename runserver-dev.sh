#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
$ROOT/system/venv.sh

export DJANGO_SETTINGS_MODULE={{ project_name }}.localsettings
$ROOT/src/manage.py syncdb
$ROOT/src/manage.py runserver
