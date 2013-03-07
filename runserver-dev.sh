#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
NAME=`cat ${ROOT}/system/name.conf`
export DJANGO_SETTINGS_MODULE=${NAME}.localsettings
source ${ROOT}/venv.sh
set +e; src/manage.py schemamigration ${NAME} --auto; set +e;
src/manage.py migrate ${NAME}
src/manage.py syncdb
exec src/manage.py runserver
