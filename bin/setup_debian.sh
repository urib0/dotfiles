#!/bin/bash

# ログ出力の設定
LOG_OUT=./$(date +"log_%Y%m%d_%H%M%S%m.txt")

exec 1> >(tee -a $LOG_OUT)
exec 2>>$LOG_OUT
# 将来的にログだけタイムスタンプつけるようにしたい
#exec 1> >(
#  while read -r l; do echo "[$(date +"%Y-%m-%d %H:%M:%S")] $l"; done \
#    | tee -a $LOG_OUT
#)

sudo printf ''

echo "STATE_1 apt upgrade"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "STATE_2 create symbolic links"
cd ~
if ! [ -f ".bash_aliases" ]; then
  ln -s ./dotfiles/.bash_aliases .
fi
if ! [ -f ".tmux.conf" ]; then
  ln -s ./dotfiles/.tmux.conf .
fi
cd -

echo "STATE_3 install packages"
sudo apt install -y htop
sudo apt install -y git
sudo apt install -y tmux
sudo apt install -y avahi-daemon
sudo apt install -y openssh-server

echo "STATE_4 install pyenv"
./setup_debian_pyenv.sh

echo "STATE_5 some settings"
echo 'XKBOPTIONS="ctrl:nocaps"' |sudo tee -a /etc/default/keyboard > /dev/null

