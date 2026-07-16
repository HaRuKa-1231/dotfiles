export PATH="$HOME/bin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export LANG="en_US.UTF-8"
export EDITOR="vim"

if [[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]]; then
  export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
fi

if command -v brew >/dev/null 2>&1; then
  brew_prefix="$(brew --prefix)"

  for dir in \
    "$brew_prefix/opt/openssl@1.1/bin" \
    "$brew_prefix/opt/gnu-sed/libexec/gnubin" \
    "$brew_prefix/opt/libpq/bin" \
    "$brew_prefix/sbin"; do
    [[ -d "$dir" ]] && export PATH="$dir:$PATH"
  done

  unset dir brew_prefix
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if [[ -d "$HOME/.rd/bin" ]]; then
  export PATH="$HOME/.rd/bin:$PATH"
fi
