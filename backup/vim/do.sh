#!/usr/bin/env bash

vimrc_path=$(cd "$(dirname "$0")"; pwd)/vimrc

# For custom config path
# https://stackoverflow.com/questions/4618151/how-to-reference-source-a-custom-vimrc-file
export VIMINIT="source ${vimrc_path}"
# or alias vim="vim -u ${vimrc_path}"
