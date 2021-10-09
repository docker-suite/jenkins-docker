# ![](https://github.com/docker-suite/artwork/raw/master/logo/png/logo_32.png) jenkins-docker
[![Build Status](http://jenkins.hexocube.fr/job/docker-suite/job/jenkins-docker/badge/icon?color=green&style=flat-square)](http://jenkins.hexocube.fr/job/docker-suite/job/jenkins-docker/)
![Docker Pulls](https://img.shields.io/docker/pulls/dsuite/jenkins-docker.svg?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/dsuite/jenkins-docker.svg?style=flat-square)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/dsuite/jenkins-docker/latest.svg?style=flat-square)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/dsuite/jenkins-docker/latest.svg?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat-square)](https://opensource.org/licenses/MIT)

It is a good practice to run the [jenkins] job inside docker containers rather than [jenkins] host machine itself.

- It maintain isolation between multiple Jenkins Pipelines and Jobs.
- Easily reproducible job execution environment setup.


This image is based on `docker:dind` and can be used as a docker cloud on [jenkins] server with [docker plugin]



## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) How to use this image

For a complete Jenkins setup, look at [jenkins setup][jenkins-setup]


[jenkins]: https://jenkins.io/
[jenkins-setup]: https://github.com/docker-suite/jenkins-setup/
[docker plugin]: https://plugins.jenkins.io/docker-plugin/
