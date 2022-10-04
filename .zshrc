function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi


alias ll="ls -lhAF"
alias tm="tmux"
alias activate=". .venv/bin/activate"

#git
alias g='git'
alias ga='git add'
alias gb='git branch -a'
alias gc='git commit -m'
alias gd='git diff'
alias gf='git fetch'
alias gr="git remote -v"
alias gs='git status'
alias gl='git log'
alias gps='git push'
alias gpl='git pull'

setopt hist_ignore_dups
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_all_dups

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
