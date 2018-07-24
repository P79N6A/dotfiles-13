# IDE-Settings

执行install.sh

### Shell-Setting

如果没有root权限,则需要手动编译源码,把可执行文件放在~/bin目录下

#### 配置zsh

```shell
#linux
sudo yum install zsh
sudo apt-get install zsh
brew install zsh          #mac 默认已经安装了
chsh -s /bin/zsh          #切换默认shell
```

插件

```shell
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
brew install autojumps
brew install bat
```

#### 配置vim

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim命名:PluginInstall
```

#### 配置tmux

