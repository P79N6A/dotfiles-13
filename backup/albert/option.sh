#!/usr/bin/env bash


config_path=$(cd "$(dirname "$0")"; pwd)/albert.conf
target_path=$HOME/.config/albert/albert.conf

function backup_albert(){
    echo "link albert from ${config_path} to ${target_path}"
    ln -sf ${config_path} ${target_path}
}
