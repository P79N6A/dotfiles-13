#!/usr/bin/env bash

app=${1:-nothing}
echo "Start install ${app}"

if [[ ${app} == "docker" ]]; then
    sudo sh -c "$(curl -fsSL https://get.docker.com/)" \
        && sudo groupadd docker -f && sudo usermod -aG docker ${USER}

elif [[ ${app} == "hexo" || ${app} == "node" ]]; then
    # https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt -y install nodejs npm
    sudo npm install npm@latest  hexo-cli -g
    #if On npm install: Unhandled rejection Error: EACCES: permission denied
    # sudo chown -R $USER:$GROUP ~/.npm
    # sudo chown -R $USER:$GROUP ~/.config

elif [[ ${app} == "guake" ]]; then
    sudo apt -y install guake

elif [[ ${app} == "typora" ]]; then
    # https://typora.io/#linux
    # or run:
    # sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    sudo add-apt-repository 'deb https://typora.io/linux ./'
    sudo apt -y install typora

elif [[ ${app} == "keepassxc" ]]; then
    sudo add-apt-repository ppa:phoerious/keepassxc
    sudo apt install keepassxc

elif [[ ${app} == "opengl" ]]; then
    sudo apt -y install build-essential libgl1-mesa-dev \
        freeglut3-dev libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev

elif [[ ${app} == "uget" ]]; then
    # https://ugetdm.com/downloads/ubuntu/
    sudo add-apt-repository ppa:plushuang-tw/uget-stable
    sudo apt -y install uget aria2

elif [[ ${app} == "apache2" ]]; then
    sudo apt -y install apache2 apache2-dev

else
    echo "Nothing to be install"
fi
