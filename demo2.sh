#!/usr/bin/env bash

########################
# include the magic
########################
. ./demo-magic.sh

#
# speed at which to simulate typing. bigger num = faster
#
TYPE_SPEED=40


# hide the evidence
clear

pe 'cat Dockerfile'
pe 'docker build -f Dockerfile -t my-tf .'
pe 'docker run --runtime=nvidia -it --rm -v $(realpath ./notebooks):/tf/notebooks -p 8888:8888 my-tf'

