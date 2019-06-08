#!/usr/bin/env bash


config_path=$(cd "$(dirname "$0")"; pwd)/albert.conf
target_path=$HOME/.config/albert/albert.conf

function do-albert() {
    if [[ $1 == "link" ]]; then
        echo "link to ${target_path/#$HOME/\~}"
        ln -sf ${config_path} ${target_path}
    else
        echo "Nothing to be done, please input [link]"
    fi
}

function _do-albert() {
    _alternative \
        'args:custom arg:((link\:"link to ${target_path/#$HOME/\~}" none\:"none"))'
}
compdef _do-albert do-albert
