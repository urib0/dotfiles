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

echo "STATE_2 create symbolic link"
cd ~
ln -s ./dotfiles/.bash_aliases .
ln -s ./dotfiles/.tmux.conf .
cd -

echo 'XKBOPTIONS="ctrl:nocaps"' |sudo tee -a /etc/default/keyboard > /dev/null

echo "STATE_3 install packages"
sudo apt install -y git
sudo apt install -y tmux
