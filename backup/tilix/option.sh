#!/usr/bin/env bash

base_dir=$(
    cd "$(dirname "$0")"
    pwd
)
opt=${1:-nothing}

# https://github.com/gnunn1/tilix/#migrating-settings-from-terminix

if [[ ${opt} == "dump" ]]; then
    echo "start to dump"
    dconf dump /com/gexperts/Tilix/ >${base_dir}/tilix.dconf

elif [[ ${opt} == "load" ]]; then
    echo "start to load"
    dconf load /com/gexperts/Tilix/ <${base_dir}/tilix.dconf

else
    echo "Nothing to do"
fi
