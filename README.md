# Docker Pyhton

Docker Image for [Python](https://www.python.org/) based on airdock/base:latest

Purpose of this image is:

- install Python 2.7.9
- based on airdock/base:latest (debian)


> Name: airdock/python

***Dependency***: airdock/base:latest
 

# Usage

You should have already install [Docker](https://www.docker.com/).
Download [automated build](https://registry.hub.docker.com/u/airdock/) from public [Docker Hub Registry](https://registry.hub.docker.com/):
`docker search airdock`.

Execute rabbitmq server with default configuration:
	'docker run -t -i airdock/python '


### Run python with persistent data directory.

	docker run -t -i -v /var/lib/py:/var/lib/py airdock/python 
 

Take care about your permission on host folder named '/var/lib/py'.

The user py (uid 4206) in your container should be known into your host.
See [How Managing user in docker container](https://github.com/airdock-io/docker-base/blob/master/README.md#how-managing-user-in-docker-container) and  [Common User List](https://github.com/airdock-io/docker-base/blob/master/CommonUserList.md).

So you should create an user with this uid:gid:

```
  sudo groupadd py -g 4206
  sudo useradd -u 4206  --home-dir /var/lib/py --create-home --system --no-user-group py
  sudo usermod -g py py
```



# Change Log


## latest (current)

- add python 
- install virtualenv
- current directory "/var/lib/py" 
- define py:py user


# Build

Alternatively, you can build an image from [Dockerfile](https://github.com/airdock-io/docker-python).
Install "make" utility, and execute: `make build`

In Makefile, you could retrieve this *variables*:

- NAME: declare a full image name (aka airdock/python)
- VERSION: declare image version

And *tasks*:

- ***all***: alias to 'build'
- ***clean***: remove all container which depends on this image, and remove image previously builded
- ***build***: clean and build the current version
- ***tag_latest***: tag current version with ":latest"
- ***release***: build and execute tag_latest, push image onto registry, and tag git repository
- ***debug***: launch default command with builded image in interactive mode
- ***run***: run image as daemon and print IP address.



# License

```
 Copyright (c) 1998, 1999, 2000 Thai Open Source Software Center Ltd

 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
 "Software"), to deal in the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to
 the following conditions:

 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
