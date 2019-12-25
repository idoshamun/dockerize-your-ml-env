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

pe 'python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"'
# Inline python example
pe 'docker run -it --rm tensorflow/tensorflow:latest python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"'
# CPU Jupyter example
pe 'docker run -it --rm -v $(realpath ./notebooks):/tf/notebooks -p 8888:8888 tensorflow/tensorflow:latest-py3-jupyter'
# GPU Jupyter example
pe 'docker run --runtime=nvidia -it --rm -v $(realpath ./notebooks):/tf/notebooks -p 8888:8888 tensorflow/tensorflow:latest-gpu-py3-jupyter'

