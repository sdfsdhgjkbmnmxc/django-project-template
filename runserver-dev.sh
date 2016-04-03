#!/bin/bash
set -e
cd `dirname $0`
NAME=`cat system/name.conf`
export DJANGO_SETTINGS_MODULE=${NAME}.localsettings
src/manage-venv.sh makemigrations ${NAME}
src/manage-venv.sh migrate
src/manage-venv.sh runserver --traceback
