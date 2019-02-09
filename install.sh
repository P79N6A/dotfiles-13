#!/usr/bin/env bash

if [ "$(uname)" = "Darwin" ];then
echo "Mac OS X system!"

echo "start install"
brew install mosh tmux autojumps rmtrash

elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ];then
echo "Linux system!"

sudo apt update && apt dist-upgrade && apt autoremove  

sudo apt install python3 python-pip python3-pip virtualenv \
        apache2 vim libapache2-mod-wsgi \
        language-pack-zh-hant-base language-pack-zh-hans-base \
        mosh tmux zsh autojump

# if pip error after upgrade
# sudo python -m pip uninstall pip && sudo apt install python-pip --reinstall
# sudo python3 -m pip uninstall pip && sudo apt install python3-pip --reinstall
sudo pip2 install --upgrade pip && pip3 install --upgrade pip

echo "start install docker"
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh && groupadd docker && usermod -aG docker $USER
sudo rm get-docker.sh

else
echo "unknown system"
fi


sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "start link"
./link.sh

echo "start clone"
./clone.sh

