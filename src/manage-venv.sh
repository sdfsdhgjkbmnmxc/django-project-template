#!/bin/bash
cd `dirname $0`
exec ../.venv/bin/python3 ./manage.py $@
