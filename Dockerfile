# VERSION 1.0
# AUTHOR:         Jerome Guibert <jguibert@gmail.com>
# DESCRIPTION:    Python Dockerfile
# TO_BUILD:       docker build --rm -t airdock/python .
# SOURCE:         https://github.com/airdock-io/docker-python

# Pull base image.
FROM airdock/base:latest

MAINTAINER Jerome Guibert <jguibert@gmail.com>

RUN apt-get update -qq && \
  apt-get install -y --force-yes git build-essential libssl-dev python python-pip python-dev libxml2-dev libxslt-dev zlib1g-dev && \
  pip install -q virtualenv && \ 
  cd /var/lib && virtualenv py  && cd py && . bin/activate && \
  /root/post-install

# Environment variable for python
ENV VIRTUAL_ENV /var/lib/py
ENV PATH /var/lib/py/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# home related repository
WORKDIR /var/lib/py

# Define default command.
CMD ["gosu", "py:py", "/bin/bash", "-l"]
