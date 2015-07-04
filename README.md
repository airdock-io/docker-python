# Docker Pyhton

Docker Image for [Python](https://www.python.org/) based on airdock/base:latest

Purpose of this image is:

- install Python 2.7.9
- based on airdock/base:latest (debian)


> Name: airdock/python

***Dependency***: airdock/base:latest


# Usage

You should have already install [Docker](https://www.docker.com/).

Execute python with default configuration:
	'docker run -t -i airdock/python '


### Run python with persistent data directory.

	docker run -t -i -v /var/lib/py:/var/lib/py airdock/python


Take care about your permission on host folder named '/var/lib/py'.

The user py (uid 4206) in your container should be known into your host.
See :
* [How Managing user in docker container ?](https://github.com/airdock-io/docker-base/wiki/How-Managing-user-in-docker-container)
* [Common User List](https://github.com/airdock-io/docker-base/wiki/Common-User-List)

So you should create an user with this uid:gid:

```
  sudo groupadd py -g 4206
  sudo useradd -u 4206  --home-dir /var/lib/py --create-home --system --no-user-group py
  sudo usermod -g py py
```
Don't forget to add your current user to this new group.


# Change Log


## latest (current)

- add python
- install virtualenv
- current directory "/var/lib/py"
- define py:py user
- MIT License

# Build

- Install "make" utility, and execute: `make build`
- Or execute: 'docker build -t airdock/python:latest --rm .'

See [Docker Project Tree](https://github.com/airdock-io/docker-base/wiki/Docker-Project-Tree) for more details.


# MIT License

```
The MIT License (MIT)

Copyright (c) 2015 Airdock.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
