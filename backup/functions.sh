#!/usr/bin/env bash

function p() {
    echo "$(
        cd "$(dirname "$1")"
        pwd -P
    )/$(basename "$1")"
}

function psgrep() {
    ps -aux | grep --color=always "${1:-ssh}" | grep -v grep
}

function getip() {
    if [[ -x "$(command -v ip)" ]]; then
        ip addr | awk '/inet /{print $2}' | command grep -v 127.0.0.1
    else
        ifconfig | awk '/inet /{print $2}' | command grep -v 127.0.0.1
    fi
}

function use_tuna_mirror() {
    # https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/
    # 18.04
    mv /etc/apt/sources.list /etc/apt/sources.list.old
    echo '''
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
    deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
    ''' >/etc/apt/sources.list
}
