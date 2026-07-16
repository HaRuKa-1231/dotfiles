if [[ -o interactive ]] && command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if [[ -x "$HOME/.local/bin/mise" ]]; then
  eval "$("$HOME/.local/bin/mise" activate zsh --shims)"
elif command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh --shims)"
fi
