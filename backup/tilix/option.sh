#!/usr/bin/env bash

base_dir=$(
    cd "$(dirname "$0")"
    pwd
)

# https://github.com/gnunn1/tilix/#migrating-settings-from-terminix

function backup_tilix() {
    if [[ $1 == "dump" ]]; then
        echo "start to dump tilix config"
        dconf dump /com/gexperts/Tilix/ >${base_dir}/tilix.dconf

    elif [[ $1 == "load" ]]; then
        echo "start to load tilix config"
        dconf load /com/gexperts/Tilix/ <${base_dir}/tilix.dconf

    else
        echo "Nothing to be done, please input [dump/load]"
    fi
}