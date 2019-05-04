#!/usr/bin/env bash

app=${1:-nothing}
echo "Start install ${app}"

if [[ ${app} == "docker" ]]; then
    sudo sh -c "$(curl -fsSL https://get.docker.com/)" &&
        sudo groupadd docker -f && sudo usermod -aG docker ${USER}

elif [[ ${app} == "hexo" || ${app} == "node" ]]; then
    # https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt -y install nodejs
    sudo apt -y install npm
    sudo npm install npm@latest hexo-cli -g
    #if On npm install: Unhandled rejection Error: EACCES: permission denied
    # sudo chown -R $USER:$GROUP ~/.npm
    # sudo chown -R $USER:$GROUP ~/.config

elif [[ ${app} == "guake" ]]; then
    sudo apt -y install guake

elif [[ ${app} == "typora" ]]; then
    # https://typora.io/#linux
    # or run:
    # sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    sudo add-apt-repository 'deb https://typora.io/linux ./'
    sudo apt -y install typora

elif [[ ${app} == "keepassxc" ]]; then
    sudo add-apt-repository ppa:phoerious/keepassxc
    sudo apt install keepassxc

elif [[ ${app} == "opengl" ]]; then
    sudo apt -y install build-essential libgl1-mesa-dev \
        freeglut3-dev libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev

elif [[ ${app} == "uget" ]]; then
    # https://ugetdm.com/downloads/ubuntu/
    sudo add-apt-repository ppa:plushuang-tw/uget-stable
    sudo apt -y install uget aria2

elif [[ ${app} == "apache2" ]]; then
    sudo apt -y install apache2 apache2-dev

elif [[ ${app} == "rust" ]]; then
    # https://www.rust-lang.org/tools/install
    # 默认会安装在~/.cargo/bin目录下
    curl https://sh.rustup.rs -sSf | sh

elif [[ ${app} == "wireshark" ]]; then
    sudo apt -y install wireshark
    sudo usermod -a -G wireshark $USER
    # sudo dpkg-reconfigure wireshark-common
    # choice yes for without root

elif [[ ${app} == "netdata" ]]; then
    # https://github.com/netdata/netdata/tree/master/packaging/installer#installation
    bash <(curl -Ss https://my-netdata.io/kickstart.sh)

elif [[ ${app} == "code-server" ]]; then
    wget -qO- -t1 -T2 https://api.github.com/repos/codercom/code-server/releases/latest \
        | jq '.assets[] | .browser_download_url' | grep linux \
        | xargs wget -P $HOME/.local/bin 

elif [[ ${app} == "qmmp" ]]; then
    sudo add-apt-repository ppa:forkotov02/ppa
    sudo apt install qmmp

elif [[ ${app} == "stacer" ]]; then
    sudo add-apt-repository ppa:oguzhaninan/stacer -y
    sudo apt -y install stacer

elif [[ ${app} == "sublime" ]]; then
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt -y install sublime-text

elif [[ ${app} == "ss-qt5" ]]; then
    sudo add-apt-repository ppa:leaeasy/shadowsocks
    sudo apt -y install shadowsocks-qt5

elif [[ ${app} == "fcitx" ]]; then
    sudo add-apt-repository ppa:fcitx-team/nightly
    sudo apt -y install fcitx-config-gtk fcitx-googlepinyin fcitx-module-cloudpinyin fcitx-table-all
    sudo apt -y remove fcitx-module-kimpanel

elif [[ ${app} == "libreoffice" ]]; then
    sudo apt -y libreoffice libreoffice-l10n-zh-cn

else
    echo "Nothing to be install"
fi
