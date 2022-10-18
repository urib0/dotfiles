HOMEDIR=$(pwd)
cd ~
if ! [ -f ".bash_aliases" ]; then
  ln -s ./dotfiles/.bash_aliases .
fi
if ! [ -f ".bash_profile" ]; then
  ln -s ./dotfiles/.bash_profile .
fi
if ! [ -f ".aliases" ]; then
  ln -s ./dotfiles/.aliases .
fi
if ! [ -f ".tmux.conf" ]; then
  ln -s ./dotfiles/.tmux.conf .
fi
if ! [ -d ".config/powerline-shell" ]; then
  mkdir .config/powerline-shell
  cd .config/powerline-shell
  ln -s ~/dotfiles/powerline-shell/config.json .
  cd ~
fi
cd $HOMEDIR
