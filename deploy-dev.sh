#!/bin/sh
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
$ROOT/system/venv.sh

# example: HOST=myserver.com
HOST=

if [ -z "$HOST" ]; then
    echo "Setup HOST variable in $0!"
    exit 1
fi

NAME={{ project_name }}
PROJECT_ROOT=/var/www/$NAME
VENV=$PROJECT_ROOT/system/venv
USER=www-data
GROUP=www-data

DEB=`tr '\n' ' ' < $ROOT/system/debian.txt`

echo "[`date +%H:%M:%S`] prepare"
sed -i 's/YOUR.DOMAIN/${HOST}/g' $ROOT/system/*
ssh $HOST "\
    sudo apt-get install -y $DEB &&\
    sudo mkdir -p $PROJECT_ROOT $VENV &&\
    sudo chown -R \`whoami\` $PROJECT_ROOT &&\
    sudo chmod u+w $PROJECT_ROOT &&\
    sudo find $PROJECT_ROOT -name \*.sh -type f -exec chmod +x {} \; &&\
    bin/bash $PROJECT_ROOT/system/env.sh &&\
    true"

echo "[`date +%H:%M:%S`] copy files"
rsync $ROOT --recursive -F $HOST:$PROJECT_ROOT

echo "[`date +%H:%M:%S`] run postinstall"
ssh $HOST "\
    sudo chown -R $USER:$GROUP $PROJECT_ROOT &&\
    sudo /bin/bash $PROJECT_ROOT/system/postinstall.sh &&\
    true"

echo "[`date +%H:%M:%S`] done"