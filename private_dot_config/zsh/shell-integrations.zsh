[[ -o interactive ]] || return

if command -v brew >/dev/null 2>&1; then
  brew_prefix="$(brew --prefix)"
  [[ -f "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  zsh_syntax_highlighting="$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  unset brew_prefix
fi

for f in "$HOME"/.zsh/functions/*.zsh(N); do
  source "$f"
done

if command -v docker >/dev/null 2>&1; then
  source <(docker completion zsh)
fi

if [[ "$TERM_PROGRAM" == "kiro" ]] && command -v kiro >/dev/null 2>&1; then
  source "$(kiro --locate-shell-integration-path zsh)"
fi

if [[ -n "$zsh_syntax_highlighting" && -f "$zsh_syntax_highlighting" ]]; then
  source "$zsh_syntax_highlighting"
fi
unset zsh_syntax_highlighting
