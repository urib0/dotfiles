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

sudo apt update
sudo apt upgrade -y
sudo apt autoremove

cd ~
ln -s ./dotfiles/.bash_aliases .
ln -s ./dotfiles/.tmux.conf .

echo 'XKBOPTIONS="ctrl:nocaps"' |sudo tee -a /etc/default/keyboard > /dev/null

sudo apt install -y git
sudo apt install -y tmux
