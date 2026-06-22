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

setopt hist_ignore_dups
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_all_dups

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -L ~/.aliases ]; then
  . ~/.aliases
fi


export PATH="$HOME/bin/:$PATH"

autoload -Uz compinit && compinit -u

# Machine-local settings (not tracked in dotfiles)
if [ -f ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

# rmをゴミ箱（trash）に置き換える
rm() {
    local args=()
    for arg in "$@"; do
        # ハイフンで始まるオプション（-rf, -f, -rなど）を除外してファイル名だけを抽出
        if [[ "$arg" != -* ]]; then
            args+=("$arg")
        fi
    done
    
    if [ ${#args[@]} -gt 0 ]; then
        # Finderのゴミ箱に移動
        command trash "${args[@]}"
    else
        echo "rm: オプションは無視されました。対象ファイルが指定されていません。"
    fi
}

# direnv
eval "$(direnv hook zsh)"
