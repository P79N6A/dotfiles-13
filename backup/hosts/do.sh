#!/usr/bin/env bash



function do-hosts (){
    if [[ $1 == "set" ]]; then

        now=$(date +%Y-%m-%d)
        sudo cp /etc/hosts /etc/hosts-${now}.back
        sudo bash -c "curl https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts-compact > /etc/hosts"
        sudo systemctl restart NetworkManager

    elif [[ $1 == "reset" ]]; then

    else
        echo "Nothing to be done, please input [set/reset]"
    fi

    # for win
    # ipconfig /flushdns
    # for mac
    # sudo killall -HUP mDNSResponder
}
