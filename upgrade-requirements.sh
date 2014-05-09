#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
source ${ROOT}/venv.sh
if [[ "`uname`" == "Darwin" ]]; then
    export CFLAGS=-Qunused-arguments
    export CPPFLAGS=-Qunused-arguments
fi
exec pip install -r ${ROOT}/system/requirements.txt --upgrade
