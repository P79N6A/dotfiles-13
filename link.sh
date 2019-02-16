#!/usr/bin/env bash

names=('.zshrc' '.tmux.conf' '.vimrc' '.vim' '.userrc' '.clang-format' '.gitignore_global' '.ssh')

for x in ${names[@]}; do
    file=$HOME/${x}
    if [[ -e ${file} ]]; then
        read -p "$file exists. do you delete it? (y/n)? " answer
        if [[ ! ${answer} ]]; then answer='n'; fi

        if [[ ${answer} == 'y' ]];then
            rm -rf ${file}
            ln -s $PWD/${x} ${file}
        fi
    else
        ln -s $PWD/${x} ${file}
    fi
done


ln -s $PWD/icecory.zsh-theme $HOME/.oh-my-zsh/custom/themes/icecory.zsh-theme

echo "link success!"
