#!/usr/bin/env bash

function do-hosts() {
    if [[ $1 == "set" ]]; then
        if [[ $(wc -l /etc/hosts | awk '{print $1}') -lt 100 ]]; then
            echo "back up origin hosts file"
            sudo mv /etc/hosts.back
        fi
        sudo bash -c "curl https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts-compact > /etc/hosts"
        sudo systemctl restart NetworkManager

    elif [[ $1 == "unset" ]]; then
        if [[ -f /etc/hosts.back ]]; then
            echo "restore /etc/hosts.back"
            sudo mv /etc/hosts.back /etc/hosts
        else
            echo "file /etc/hosts.back not exists~"
        fi

    else
        echo 'Nothing to be done!'
    fi
}

function _do-hosts() {
    _alternative \
        'args:custom arg:((set\:"write google-hosts to /etc/hosts" unset\:"unset /etc/hosts"))'
}
compdef _do-hosts do-hosts
