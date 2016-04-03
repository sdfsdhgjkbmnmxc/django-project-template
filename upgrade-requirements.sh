#!/bin/bash
set -e
cd `dirname $0`
if [[ "`uname`" == "Darwin" ]]; then
    export CFLAGS=-Qunused-arguments
    export CPPFLAGS=-Qunused-arguments
    if [[ -n "`which brew`" ]]; then
        brew install `cat brew-requirements.txt`
    fi
fi
pyvenv .venv
.venv/bin/pip install -r system/requirements.txt --upgrade
src/manage-venv.sh bower install
