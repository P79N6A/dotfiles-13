#!/usr/bin/env bash

names=('.zshrc' '.tmux.conf' '.vimrc' '.clang-format' '.gitconfig' '.pip')

for x in ${names[@]}; do
    file=$HOME/${x}
    if [[ -e ${file} ]] || [[ -L ${file} ]]; then
        read -p "$file exists. do you delete it? (y/n)? " answer
        if [[ ! ${answer} ]]; then answer='n'; fi

        if [[ ${answer} == 'y' ]];then
            /bin/rm -rf ${file}
            ln -s $PWD/${x} ${file}
        fi
    else
        ln -s $PWD/${x} ${file}
    fi
done

echo "link success!"
