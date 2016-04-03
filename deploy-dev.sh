#!/bin/bash
cd `dirname $0`
export HOST=`cat system/host.conf`
exec system/_deploy-dev.sh
