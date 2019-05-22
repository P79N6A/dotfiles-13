#!/usr/bin/env bash

tmux_conf=$(cd "$(dirname "$0")"; pwd)/tmux.conf

alias tmux="tmux -f ${tmux_conf}"
