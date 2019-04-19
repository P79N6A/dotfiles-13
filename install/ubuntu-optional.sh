#!/usr/bin/env bash

sudo apt -y install apache2 apache2-dev filezilla


# for docker
sudo sh -c "$(curl -fsSL https://get.docker.com/)" \
    && sudo groupadd docker && sudo usermod -aG docker ${USER}


# for java


# for nodejs npm and hexo
# https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs npm
sudo npm install npm@latest -g
sudo npm install hexo-cli -g
#if On npm install: Unhandled rejection Error: EACCES: permission denied
# sudo chown -R $USER:$GROUP ~/.npm
# sudo chown -R $USER:$GROUP ~/.config


# for uget
# https://ugetdm.com/downloads/ubuntu/
sudo add-apt-repository ppa:plushuang-tw/uget-stable
sudo apt install uget aria2

# for guake
sudo apt -y install guake

# for typora
# https://typora.io/#linux
# or run:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt -y install typora

# for keepassxc
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt install keepassxc
