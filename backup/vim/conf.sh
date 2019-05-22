#!/usr/bin/env bash

vimrc_path=$(cd "$(dirname "$0")"; pwd)/vimrc

export VIMINIT="source ${vimrc_path}"

# https://stackoverflow.com/questions/4618151/how-to-reference-source-a-custom-vimrc-file

# or alias vim="vim -u ${vimrc_path}"
