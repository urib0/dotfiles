function _update_ps1() {
#  PS1=$(/home/ubuntu/.local/bin/powerline-shell $?)
  PS1=$(powerline-shell $?)
 }

 if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
 fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

. .aliases
