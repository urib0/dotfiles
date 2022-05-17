#!/bin/sh

sudo printf ''

sudo apt update
sudo apt upgrade -y

cd /home/ubuntu
ln -s ./dotfiles/.bash_aliases .
ln -s ./dotfiles/.tmux.conf .

sudo apt install -y git
sudo apt install -y tmux
