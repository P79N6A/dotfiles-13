#!/usr/bin/env bash

# use theme
# https://github.com/oriolmirosa/jupyterlab_materialdarker
# jupyter labextension install @oriolmirosa/jupyterlab_materialdarker

# custome config file
# https://jupyter.readthedocs.io/en/latest/projects/jupyter-directories.html#id1
conf_path=$(cd "$(dirname "$0")"; pwd)

export JUPYTER_CONFIG_DIR=${conf_path}
