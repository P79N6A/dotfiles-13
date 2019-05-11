#!/usr/bin/env bash

brew install mosh tmux rmtrash ipython clang-format bat peco the_silver_searcher

# oh-my-zsh
# update: upgrade_oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s /bin/zsh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
exec $HOME/.fzf/install

# VundleVim
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git \
    $HOME/.vim/bundle/Vundle.vim