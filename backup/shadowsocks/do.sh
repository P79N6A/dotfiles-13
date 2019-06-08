#!/usr/bin/env bash

function do-ss() {
    if [[ $1 == "start-local" ]]; then
        ss-local -s ${REMOTE_SS_IP} -p ${REMOTE_SS_PORT} -k ${REMOTE_SS_PASS} -m rc4-md5 -l ${SOCKS_PROXY_PORT} -v
    else
        echo 'Nothing to be done!'
    fi
}

function _do-ss() {
    _alternative 'args:custom arg:((start-local\:"start local"))'
}
compdef _do-ss do-ss
