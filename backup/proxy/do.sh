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

    elif [[ $1 == "unset" ]]; then
        echo "git unset proxy"
        git config --global --unset http.proxy
        git config --global --unset https.proxy

    else
        echo 'Nothing to be done!'
    fi
}

function _do-proxy-git() {
    _alternative 'args:custom arg:((set-http\:"" set-socks\:"" unset\:""))'
}
compdef _do-proxy-git do-proxy-git

function do-proxy-env() {
    if [[ $1 == "set" ]]; then
        echo "set env http_proxy on port[${HTTP_PROXY_PORT}]"
        export http_proxy=http://127.0.0.1:${HTTP_PROXY_PORT}
        export https_proxy=http://127.0.0.1:${HTTP_PROXY_PORT}

    elif [[ $1 == "unset" ]]; then
        echo "unset http_proxy"
        unset http_proxy && unset https_proxy

    elif [[ $1 == "test" ]]; then
        if [[ $(http_proxy=http://localhost:${HTTP_PROXY_PORT} \
            curl www.google.com --connect-timeout 2 -s) ]]; then
            echo "${fg[blue]}proxy is good"
        else
            echo "${fg[red]}proxy is bad"
        fi

    else
        echo 'Nothing to be done!'
    fi
}

function do-proxy-snap() {
    if [[ "$1" == "set" ]]; then
        echo "set snap proxy on port[${HTTP_PROXY_PORT}]"
        sudo snap set system proxy.https=http://127.0.0.1:${HTTP_PROXY_PORT}
        sudo snap set system proxy.http=http://127.0.0.1:${HTTP_PROXY_PORT}

    elif [[ "$1" == "unset" ]]; then
        echo "unset snap proxy"
        sudo snap set system proxy.http=null
        sudo snap set system proxy.https=null

    else
        echo 'Nothing to be done!'
    fi
}

function do-proxy-apt() {
    if [[ "$1" == "set" ]]; then
        echo "set apt proxy on port[${HTTP_PROXY_PORT}]"
        sudo sed -i -e '/^[#]*Acquire::http[s]*::Proxy/d' /etc/apt/apt.conf
        sudo bash -c "echo Acquire::http::Proxy \"http://127.0.0.1:${HTTP_PROXY_PORT}\"\; >> /etc/apt/apt.conf"
        sudo bash -c "echo Acquire::https::Proxy \"http://127.0.0.1:${HTTP_PROXY_PORT}\"\; >> /etc/apt/apt.conf"
    elif [[ "$1" == "unset" ]]; then
        echo "unset apt proxy"
        sudo sed -i -e '/^[#]*Acquire::http[s]*::Proxy/d' /etc/apt/apt.conf
    else
        echo 'Nothing to be done!'
    fi
}

function _do-proxy-common() {
    _alternative 'args:custom arg:((set\:"set http proxy" unset\:"unset proxy config"))'
}
compdef _do-proxy-common do-proxy-env do-proxy-snap do-proxy-apt

function do-proxy-status() {
    echo "${fg[blue]}env proxy status:"
    if [[ -n "${http_proxy}" ]]; then
        echo "${fg[red]}\t http_proxy=${http_proxy}"
    fi
    if [[ -n "${https_proxy}" ]]; then
        echo "${fg[red]}\t https_proxy=${https_proxy}"
    fi

    echo "${fg[blue]}git proxy status:"
    if [[ -n $(git config http.proxy) ]]; then
        echo "${fg[red]}\t git http.proxy=$(git config http.proxy)"
    fi
    if [[ -n $(git config https.proxy) ]]; then
        echo "${fg[red]}\t git https.proxy=$(git config https.proxy)"
    fi

    echo "${fg[blue]}apt proxy status:"
    apt_http_proxy=$(grep "Acquire::http::Proxy" /etc/apt/apt.conf | awk '{ print $2}')
    apt_https_proxy=$(grep "Acquire::https::Proxy" /etc/apt/apt.conf | awk '{ print $2}')
    if [[ -n ${apt_http_proxy} ]]; then
        echo "${fg[red]}\t apt http::proxy=${apt_http_proxy}"
    fi
    if [[ -n ${apt_https_proxy} ]]; then
        echo "${fg[red]}\t apt http::proxy=${apt_https_proxy}"
    fi
}
