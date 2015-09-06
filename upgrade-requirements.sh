#!/bin/bash
set -e
ROOT=`dirname $0`
. ${ROOT}/venv.sh
if [[ "`uname`" == "Darwin" ]]; then
    export CFLAGS=-Qunused-arguments
    export CPPFLAGS=-Qunused-arguments
fi
pip install -r ${ROOT}/system/requirements.txt --upgrade
${ROOT}/src/manage-venv.sh bower install
