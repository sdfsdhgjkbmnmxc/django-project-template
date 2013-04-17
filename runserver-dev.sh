#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
NAME=`cat ${ROOT}/system/name.conf`
export DJANGO_SETTINGS_MODULE=${NAME}.localsettings
source ${ROOT}/venv.sh
if [ ! -d ${ROOT}/src/${NAME}/migrations ]; then
    ${ROOT}/src/manage.py schemamigration ${NAME} --initial
fi
set +e; ${ROOT}/src/manage.py schemamigration ${NAME} --auto; set +e;
${ROOT}/src/manage.py migrate
${ROOT}/src/manage.py syncdb --delete-ghost-migrations
exec ${ROOT}/src/manage.py runserver
