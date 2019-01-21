pwd=`pwd`
names=('.zshrc' '.tmux.conf' '.vimrc' '.vim' '.userrc' '.clang-format')

for x in ${names[@]}; do
    file=$HOME/$x
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


ln -s $PWD/icecory.zsh-theme ${ZSH:~/.oh-my-zsh}/custom/themes/icecory.zsh-theme

echo "link success!"
