#!/usr/bin/env bash

brew install mosh tmux rmtrash ipython clang-format bat peco


# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# VundleVim
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git \
        $HOME/.vim/bundle/Vundle.vim
