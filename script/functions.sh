function p() {
    echo "$(
        cd "$(dirname "$1")"
        pwd -P
    )/$(basename "$1")"
}

function psgrep() {
    ps aux | grep --color=always "${1:-ssh}" | grep -v grep
}

function getip() {
    if (( ${+commands[ip]} )); then
        ip addr | awk '/inet /{print $2}' | command grep -v 127.0.0.1
    else
        ifconfig | awk '/inet /{print $2}' | command grep -v 127.0.0.1
    fi
}


function update_git_unshallow() {
    git fetch --tags
    git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
    git fetch --unshallow
}

function use_global_http_proxy() {
    if [[ "$1" == "on" ]]; then
        echo "Http proxy port :${HTTP_PROXY_PORT}"
        export http_proxy=http://127.0.0.1:${HTTP_PROXY_PORT}
        export https_proxy=http://127.0.0.1:${HTTP_PROXY_PORT}
    elif [[ "$1" == "off" ]]; then
        echo "unset http_proxy"
        unset http_proxy
        unset https_proxy
    else
        echo "Nothing to be done, please input [on/off]"
    fi
}

function use_snap_proxy() {
    if [[ "$1" == "on" ]]; then
        echo "set snap proxy"
        sudo snap set system proxy.https=http://127.0.0.1:${HTTP_PROXY_PORT}
        sudo snap set system proxy.http=http://127.0.0.1:${HTTP_PROXY_PORT}
    elif [[ "$1" == "off" ]]; then
        echo "unset snap proxy"
        sudo snap set system proxy.http=null
        sudo snap set system proxy.https=null
    else
        echo "Nothing to be done, please input [on/off]"
    fi
}

function use_git_proxy() {
    if [[ "$1" == "on" ]]; then
        if [[ "$2" == "socks" ]]; then
            echo "git use socks5 proxy"
            git config --global http.proxy 'socks5://127.0.0.1:1080'
            git config --global https.proxy 'socks5://127.0.0.1:1080'
        elif [[ "$2" == "http" ]]; then
            echo "git use http proxy"
            git config --global http.proxy http://127.0.0.1:${HTTP_PROXY_PORT}
            git config --global https.proxy http://127.0.0.1:${HTTP_PROXY_PORT}
        else
            echo "please select proxy type [http/socks]"
        fi
    elif [[ "$1" == "off" ]]; then
        echo "git unset proxy"
        git config --global --unset http.proxy
        git config --global --unset https.proxy
    else
        echo "Nothing to be done, please input [on/off]"
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

function use_git_global_ice() {
    git config --global user.name $nick_name
    git config --global user.email $user_email
}


function use_git_single_ice() {
    git config user.name $nick_name
    git config user.email $user_email
}

function use_git_single_byte() {
    git config user.name $byted_name
    git config user.email $byted_email
}

function gchb() {
    git clone git@github.com:$@
}
function gchbi() {
    git clone git@github.com:icecory/$@
}
