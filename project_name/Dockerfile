FROM ubuntu:14.04

ENV project_name project_name
RUN mkdir -p /var/www/${project_name}
WORKDIR /var/www/${project_name}

ADD system system
RUN apt-get -y update && apt-get update && apt-get install -y `cat system/debian.txt | grep -v '#' | tr '\n' ' '`
RUN pip install -r system/requirements.txt --upgrade
