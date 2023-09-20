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
if ! [ -f ".nanorc" ]; then
  ln -s ./dotfiles/.nanorc .
fi
if ! [ -d ".config/powerline-shell" ]; then
  mkdir -p .config/powerline-shell
  cd .config/powerline-shell
  ln -s ~/dotfiles/powerline-shell/config.json .
  cd ~
fi
source .bash_profile
cd $HOMEDIR
