echo "open .bash_aliases!"

alias python="python3"
alias open="xdg-open"
alias say="spd-say -l ja"

if [ -L ~/.aliases ]; then
  . ~/.aliases
fi
