#!/usr/bin/env zsh

if [[ "$(uname)" == "Darwin" ]]; then
    echo "U are in Mac OS X system!"
elif [[ "$(uname)" == "Linux" ]]; then
    echo "U are in Linux system!"
else
    echo "U are in unknwon system!"
fi

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/Cpp3rdlib/bin:$PATH
export PATH=$HOME/Qt5.12.3/5.12.3/gcc_64/bin:$PATH
export PATH=/usr/lib/go-1.12/bin:$PATH

export DOT_PATH=$HOME/dotfiles
export SOCKS_PROXY_PORT=1080
export SOCKS_PROXY_PORT_ALI=1081
export HTTP_PROXY_PORT=1090

#####################    For Self info     #####################
source $DOT_PATH/core/core_env.sh

#####################    For Zsh     #####################
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="icecory"
ZSH_CUSTOM=$DOT_PATH/backup/zsh-custom
plugins=(z git sudo tmux pip history extract gitignore fzf python
    zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-blade docker-compose)
source ${ZSH}/oh-my-zsh.sh
autoload -U compinit && compinit
# For zsh-autosuggets
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1

############## For dart && flutter && Andriod  ##############
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub/"
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export ANDROID_HOME=$HOME/Andriod-SDK-tools/
export PATH=$HOME/Andriod-SDK-tools/bin:$PATH
export PATH=$HOME/flutter/bin/cache/dart-sdk/bin:$PATH
export PATH=$HOME/flutter/bin:$PATH

##################       For npm        #####################
export NPM_CONFIG_PREFIX=$HOME/.npm-global

##################       For Go        ######################
# if [[ "$(uname)" == "Darwin" ]]; then
# else
#     export GOROOT=$HOME/.local/bin/go
#     export GOPATH=$HOME/go
# fi

##################       For Cmake        #####################
export CMAKE_PREFIX_PATH=$HOME/Cpp3rdlib/
# export CMAKE_PREFIX_PATH=$HOME/Qt5.12.1/5.12.1/clang_64
#export PKG_CONFIG_PATH=$HOME/lib/pkgconfig
#export C_INCLUDE_PATH=$HOME/include
#export CPLUS_INCLUDE_PATH=$HOME/include
#export LD_LIBRARY_PATH=$HOME/lib:$HOME/lib64:$HOME/clang/lib

##################       For conda        #####################
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/icecory/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



source $DOT_PATH/script/functions.sh
source $DOT_PATH/script/aliases.sh

source $DOT_PATH/backup/tilix/option.sh
source $DOT_PATH/backup/vscode/option.sh
source $DOT_PATH/backup/mongodb/option.sh
source $DOT_PATH/backup/github/option.sh
source $DOT_PATH/backup/albert/option.sh

source $DOT_PATH/backup/vim/conf.sh
source $DOT_PATH/backup/tmux/conf.sh # must after zsh plugin load
source $DOT_PATH/backup/pip/conf.sh
source $DOT_PATH/backup/jupyter/conf.sh
