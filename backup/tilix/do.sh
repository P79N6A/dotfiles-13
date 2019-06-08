#!/usr/bin/env bash

abs_path=$(cd "$(dirname "$0")"; pwd)

# https://github.com/gnunn1/tilix/#migrating-settings-from-terminix

function do-tilix() {
    if [[ $1 == "dump" ]]; then
        echo "start to dump tilix config"
        dconf dump /com/gexperts/Tilix/ >${abs_path}/tilix.dconf

    elif [[ $1 == "load" ]]; then
        echo "start to load tilix config"
        dconf load /com/gexperts/Tilix/ <${abs_path}/tilix.dconf

    else
        echo 'Nothing to be done!'
    fi
}

function _do-tilix() {
    _alternative 'args:custom arg:((dump\:"dump tilix config" load\:"load tilix config"))'
}
compdef _do-tilix do-tilix
