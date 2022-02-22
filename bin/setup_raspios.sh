#!/bin/sh

sudo printf ''

cd /home/pi
ln -s ./dotfiles/.bash_aliases .
ln -s ./dotfiles/.tmux.conf .

echo 'XKBOPTIONS="ctrl:nocaps"' |sudo tee -a /etc/default/keyboard > /dev/null

sudo apt install -y git
sudo apt install -y tmux


