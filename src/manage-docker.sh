#!/bin/bash
set -e
exec `dirname "${BASH_SOURCE[0]}"`/../docker.sh src/manage.py $@
