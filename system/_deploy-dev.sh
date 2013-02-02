#!/bin/sh
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`

if [ -z "$HOST" ]; then
    echo "HOST variable required"
    exit 1
fi

NAME=`cat $ROOT/name.conf`
PROJECT_ROOT=/var/www/$NAME
USER=www-data
GROUP=www-data

DEB=`tr '\n' ' ' < $ROOT/debian.txt`

echo "[`date +%H:%M:%S`] prepare"
ssh $HOST "\
    sudo apt-get install -y $DEB &&\
    sudo mkdir -p \
        $PROJECT_ROOT/system/venv \
        &&\
    sudo chown -R \`whoami\`:$GROUP $PROJECT_ROOT &&\
    sudo chmod u+w $PROJECT_ROOT &&\
    true"

echo "[`date +%H:%M:%S`] copy files"
rsync $ROOT/../ --recursive -F $HOST:$PROJECT_ROOT

echo "[`date +%H:%M:%S`] fix rights and run postinstall"
ssh $HOST "\
    sudo find $PROJECT_ROOT -name \*.sh -type f -exec chmod +x {} \; &&\
    sudo chmod +x $PROJECT_ROOT/src/manage.py &&\
    sudo chown -R $USER:$GROUP $PROJECT_ROOT &&\
    sudo $PROJECT_ROOT/system/postinstall.sh &&\
    true"

echo "[`date +%H:%M:%S`] done"
