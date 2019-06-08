#!/usr/bin/env bash

function do-proxy-git() {
    if [[ $1 == "set-http" ]]; then
        echo "git set http proxy on port[${HTTP_PROXY_PORT}]"
        git config --global http.proxy http://127.0.0.1:${HTTP_PROXY_PORT}
        git config --global https.proxy http://127.0.0.1:${HTTP_PROXY_PORT}

    elif [[ $1 == "set-socks" ]]; then
        echo "git set socks5 proxy on port[${SOCKS_PROXY_PORT}]"
        git config --global http.proxy socks5://127.0.0.1:${SOCKS_PROXY_PORT}
        git config --global https.proxy socks5://127.0.0.1:${SOCKS_PROXY_PORT}

    elif [[ $1 == "reset" ]]; then
        echo "git reset proxy"
        git config --global --unset http.proxy
        git config --global --unset https.proxy

    else
        echo "Nothing to be done!"
    fi
}

function _do-proxy-git() {
    _alternative 'args:custom arg:((set-http\:"" set-socks\:"" reset\:""))'
}
compdef _do-proxy-git do-proxy-git

function do-proxy-env() {
    if [[ $1 == "set" ]]; then
        echo "set env http_proxy on port[${HTTP_PROXY_PORT}]"
        export http_proxy=http://127.0.0.1:${HTTP_PROXY_PORT}
        export https_proxy=http://127.0.0.1:${HTTP_PROXY_PORT}
    elif [[ $1 == "reset" ]]; then
        echo "reset http_proxy"
        unset http_proxy
        unset https_proxy
    else
        echo "Nothing to be done!"
    fi
}

function do-proxy-snap() {
    if [[ "$1" == "set" ]]; then
        echo "set snap proxy on port[${HTTP_PROXY_PORT}]"
        sudo snap set system proxy.https=http://127.0.0.1:${HTTP_PROXY_PORT}
        sudo snap set system proxy.http=http://127.0.0.1:${HTTP_PROXY_PORT}

    elif [[ "$1" == "reset" ]]; then
        echo "unset snap proxy"
        sudo snap set system proxy.http=null
        sudo snap set system proxy.https=null

    else
        echo "Nothing to be done!"
    fi
}

function _do-proxy-common() {
    _alternative 'args:custom arg:((set\:"set http proxy" reset\:"reset proxy config"))'
}
compdef _do-proxy-common do-proxy-env do-proxy-snap
