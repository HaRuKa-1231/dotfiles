fpath=("$HOME/.zsh/completion" $fpath)

[[ -o interactive ]] || return

zsh_cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d "$zsh_cache_dir" ]] || mkdir -p "$zsh_cache_dir" 2>/dev/null
if [[ -d "$zsh_cache_dir" ]]; then
  ZSH_CACHE_DIR="$zsh_cache_dir"
  ZSH_COMPDUMP="$zsh_cache_dir/.zcompdump-${HOST%%.*}-${ZSH_VERSION}"
fi
unset zsh_cache_dir

if command -v brew >/dev/null 2>&1; then
  brew_prefix="$(brew --prefix)"
  [[ -d "$brew_prefix/share/zsh-completions" ]] && FPATH="$brew_prefix/share/zsh-completions:$FPATH"
  unset brew_prefix
fi

if [[ -d "$HOME/.awsume/zsh-autocomplete" ]]; then
  fpath=("$HOME/.awsume/zsh-autocomplete" $fpath)
fi

autoload -Uz compinit
compinit -i -d "${ZSH_COMPDUMP:-$HOME/.zcompdump}"
