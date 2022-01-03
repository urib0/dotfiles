#!/bin/sh

sudo printf ''

echo 'alias ll="ls -lha"' >> ~/.bashrc

echo 'XKBOPTIONS="ctrl:nocaps"' |sudo tee -a /etc/default/keyboard > /dev/null
