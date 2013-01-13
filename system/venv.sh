#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`

mkdir -p $ROOT/venv

if [ ! -f $ROOT/venv/bin/activate ]; then
    pip install virtualenv
    virtualenv $ROOT/venv
fi

source $ROOT/venv/bin/activate

# TODO: optimize
pip install -r $ROOT/requirements.txt

ARGS="$@"
if [ -n "$ARGS" ]; then
    cd $ROOT/..
    $@
fi
