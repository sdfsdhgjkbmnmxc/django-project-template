#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
NAME=`cat ${ROOT}/system/name.conf`
export DJANGO_SETTINGS_MODULE=${NAME}.localsettings
source ${ROOT}/venv.sh

${ROOT}/src/manage.py makemigrations ${NAME}
${ROOT}/src/manage.py migrate
exec ${ROOT}/src/manage.py runserver --traceback
