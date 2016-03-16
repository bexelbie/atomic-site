#!/bin/bash
# install everything in a docker container based on Fedora 23
# permit to have the same env on any system without any issue

# requires docker and being in the right group
docker build -t middleman .
docker run -dt -p 4567:4567 --privileged -v "$(pwd)":/workdir middleman
