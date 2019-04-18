#!/usr/bin/env bash

sudo apt -y install apache2 apache2-dev filezilla


# for docker
sudo sh -c "$(curl -fsSL https://get.docker.com/)" \
    && groupadd docker && usermod -aG docker ${USER}


# for java


# for nodejs
# https://github.com/nodesource/distributions/blob/master/README.md#deb
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs


# for uget
# https://ugetdm.com/downloads/ubuntu/
sudo add-apt-repository ppa:plushuang-tw/uget-stable
sudo apt install uget aria2

# for guake
sudo apt install guake

# for typora
# https://typora.io/#linux
# or run:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt install typora