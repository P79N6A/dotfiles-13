#!/usr/bin/env bash

pip_conf=$(cd "$(dirname "$0")"; pwd)/pip.conf

# https://pip.pypa.io/en/stable/user_guide/#config-file
export PIP_CONFIG_FILE=${pip_conf}
