#!/usr/bin/env bash

base_dir=$(
    cd "$(dirname "$0")"
    pwd
)

function backup_vscode(){
    if [[ $1 == "mac" ]]; then
        echo "start to link mac"
        ln -sf ${base_dir}/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
        ln -sf ${base_dir}/keybindings-mac.json $HOME/Library/Application\ Support/Code/User/keybindings.json
        ln -sf ${base_dir}/snippets $HOME/Library/Application\ Support/Code/User/snippets

    elif [[ $1 == "linux" ]]; then
        echo "start to link linux"
        ln -sf ${base_dir}/settings.json $HOME/.config/Code/User/settings.json
        ln -sf ${base_dir}/keybindings-linux.json $HOME/.config/Code/User/keybindings.json
        ln -sf ${base_dir}/snippets $HOME/.config/Code/User/snippets
    else
        echo "Nothing to be done, please input [mac/linux]"
    fi
}
