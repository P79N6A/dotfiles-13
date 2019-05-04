#!/usr/bin/env bash

# remove
sudo apt purge rhythmbox* firefox* \
    gnome-sudoku gnome-mines gnome-mahjongg gnome-todo* gnome-2048* gnome-maps \
    simple-scan aisleriot totem

sudo apt update &&
    sudo apt -y dist-upgrade &&
    sudo apt -y autoremove &&
    sudo apt -y install git mosh tmux zsh vim curl \
        python3 python-pip python3-pip virtualenv \
        ipython ipython3

# language
sudo apt install -y language-pack-zh-hant-base language-pack-zh-hans-base

# pip
sudo pip2 install --upgrade pip requests
sudo pip3 install --upgrade pip requests
# if pip error after
# sudo python -m pip uninstall pip && sudo apt install python-pip --reinstall
# sudo python3 -m pip uninstall pip && sudo apt install python3-pip --reinstall

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# snap

# https://github.com/peco/peco/releases
sudo snap install shfmt peco

# VundleVim
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git \
    $HOME/.vim/bundle/Vundle.vim
