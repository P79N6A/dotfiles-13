#!/usr/bin/env bash

if [[ "$(uname)" = "Darwin" ]];then
########################
# Mac OS X Install !!! #
########################
echo "Mac OS X system!"
brew install mosh tmux rmtrash ipython clang-format bat peco


elif [[ "$(expr substr $(uname -s) 1 5)" = "Linux" ]];then
########################
# Linux Install !!! #
########################
echo "Linux system!"

sudo apt update \
    && sudo apt dist-upgrade \
    && sudo apt autoremove \
    && sudo apt install mosh tmux zsh vim \
        python3 python-pip python3-pip virtualenv \
        apache2  libapache2-mod-wsgi \
        language-pack-zh-hant-base language-pack-zh-hans-base \
    && sudo pip2 install --upgrade pip && sudo pip3 install --upgrade pip
# if pip error after upgrade
# sudo python -m pip uninstall pip && sudo apt install python-pip --reinstall
# sudo python3 -m pip uninstall pip && sudo apt install python3-pip --reinstall

echo "start install docker"
sudo sh -c "$(curl -fsSL https://get.docker.com/)" \
    && groupadd docker && usermod -aG docker ${USER}

else
echo "unknown system !!!"
fi


echo "install oh my zsh with (zsh-autosuggestion, zsh-syntax-highlighting)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "install VundleVim"
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git \
        $HOME/.vim/bundle/Vundle.vim
