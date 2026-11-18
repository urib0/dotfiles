# プロンプト
if command -v starship >/dev/null; then
    eval "$(starship init zsh)"
fi

# 履歴設定（zsh-autosuggestions の候補元にもなる）
HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt share_history hist_ignore_all_dups hist_reduce_blanks

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
if command -v direnv >/dev/null; then
  eval "$(direnv hook zsh)"
fi

# zsh-autosuggestions（Homebrew / Debian のどちらのパスでも読み込む）
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
for f in \
  /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh; do
  if [ -f "$f" ]; then
    source "$f"
    break
  fi
done
unset f
