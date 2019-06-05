#!/usr/bin/env bash

names=('.zshrc' '.clang-format' '.gitconfig' '.style.yapf')

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

ln -sf $DOT_PATH/core/.ssh $HOME/.ssh
echo "link success!"
