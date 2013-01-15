#!/bin/bash
set -e
ROOT=`dirname "${BASH_SOURCE[0]}"`
$ROOT/venv.sh pip install -r system/requirements.txt --upgrade
