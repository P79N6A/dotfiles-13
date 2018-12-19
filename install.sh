#!/usr/bin/env bash

if [[ "$(uname)"=="Darwin" ]]
then

brew install mosh tmux autojumps rmtrash


elif [[ "$(expr substr $(uname -s) 1 5)"=="Linux" ]]
then

sudo apt update && apt dist-upgrade && apt autoremove  

sudo apt install python3 python-pip python3-pip virtualenv \
        apache2 vim libapache2-mod-wsgi \
        language-pack-zh-hant-base language-pack-zh-hans-base \
        mosh tmux zsh autojump

pip install --upgrade pip

echo "start install docker"
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER


fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "start link"
./link.sh

echo "start clone"
./clone.sh

