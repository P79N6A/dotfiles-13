#!/bin/bash

echo "install tmux vim zsh"
sudo apt install tmux vim zsh

echo "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

pwd=`pwd`
names=('.zshrc' '.tmux.conf' '.vimrc' '.vim' '.userrc')

for x in ${names[@]}; do
    file=~/$x
    if [ -e $file ]; then
        read -p "$file exists. do you delete it? (y/n)? " answer
        if [ ! $answer ]; then answer='n'; fi

        if [ $answer == 'y' ];then
            rm -rf $file
            ln -s $pwd/$x $file
        fi
    else
        ln -s $pwd/$x $file
    fi
done

echo "install zsh-autosuggestion"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "install zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "install autojump"
sudo apt install autojump

echo "install VundleVim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "init ok, please try ssh again."
