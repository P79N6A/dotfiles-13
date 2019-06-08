#!/usr/bin/env bash

abs_path=$(cd "$(dirname "$0")"; pwd)
target_prefix=$HOME/.config
if [[ "$(uname)" == "Darwin" ]]; then
    target_prefix=$HOME/Library/Application\ Support
fi

function do-vscode() {
    if [[ $1 == "link" ]]; then
        echo "start to link to ${target_prefix}"
        ln -sf ${base_dir}/settings.json ${target_prefix}/Code/User/settings.json
        ln -sf ${base_dir}/keybindings-mac.json ${target_prefix}/Code/User/keybindings.json
        ln -sf ${base_dir}/snippets ${target_prefix}/Code/User/snippets

    elif [[ $1 == "dump-ext" ]]; then
        echo "start to dump extensions to ${abs_path}"
        code --list-extensions > ${abs_path}/list-extensions.txt
    else
        echo "Nothing to be done, please input [link]"
    fi
}
