#!/usr/bin/env bash

base_dir=$(
    cd "$(dirname "$0")"
    pwd
)
opt=${1:-nothing}

if [[ ${opt} == "mac" ]]; then
    echo "start to link mac"
    ln -sf ${base_dir}/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
    ln -sf ${base_dir}/keybindings-mac.json $HOME/Library/Application\ Support/Code/User/keybindings.json
elif [[ ${opt} == "linux" ]]; then
    echo "start to link linux"
    ln -sf ${base_dir}/settings.json $HOME/.config/Code/User/settings.json
    ln -sf ${base_dir}/keybindings-linux.json $HOME/.config/Code/User/keybindings.json
else
    echo "Nothing to do"
fi
