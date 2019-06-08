#!/usr/bin/env bash



function do-hosts (){
    if [[ $1 == "set" ]]; then

        now=$(date +%Y-%m-%d)
        sudo cp /etc/hosts /etc/hosts-${now}.back
        sudo bash -c "curl https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts-compact > /etc/hosts"
        sudo systemctl restart NetworkManager

    elif [[ $1 == "reset" ]]; then

    else
        echo "Nothing to be done!"
    fi

    # for win
    # ipconfig /flushdns
    # for mac
    # sudo killall -HUP mDNSResponder
}

function _do-hosts() {
    _alternative \
        'args:custom arg:((set\:"write google-hosts to /etc/hosts" reset\:"reset /etc/hosts"))'
}
compdef _do-hosts do-hosts
