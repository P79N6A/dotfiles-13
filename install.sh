#!/bin/bash
echo "install tmux vim zsh"
sudo apt install tmux vim zsh

echo "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "install autojump"
sudo apt install autojump


