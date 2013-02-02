#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`

NAME=`cat $ROOT/name.conf`

PROJECT_ROOT=/var/www/$NAME
USER=www-data
GROUP=www-data
HOST=$1

echo "Virtualenv..."
$ROOT/venv.sh
$ROOT/upgrade-requirements.sh

echo "Logs..."
mkdir -p /var/log/$NAME
chown -R $USER:$GROUP /var/log/$NAME
ln -sf $PROJECT_ROOT/system/logrotate.conf /etc/logrotate.d/$NAME
chown root:root $PROJECT_ROOT/system/logrotate.conf

echo "Supervisor..."
ln -sf $PROJECT_ROOT/system/supervisor.conf /etc/supervisor/conf.d/$NAME.conf
supervisorctl update
supervisorctl restart ${NAME}_fcgi

echo "Nginx..."
ln -sf $PROJECT_ROOT/system/nginx.conf /etc/nginx/sites-enabled/$NAME
/etc/init.d/nginx reload

echo "Static files..."
$PROJECT_ROOT/venv.sh src/manage.py collectstatic --link --noinput
chgrp -R www-data $PROJECT_ROOT/web/
chmod -R 0775 $PROJECT_ROOT/web/

echo "Cron..."
ln -sf $PROJECT_ROOT/system/cron.conf /etc/cron.d/$NAME
chown root:root $PROJECT_ROOT/system/cron.conf

echo "Create database"
$PROJECT_ROOT/venv.sh src/manage.py syncdb --noinput
