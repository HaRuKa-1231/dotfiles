#!/bin/sh
set -eu

if ! command -v brew >/dev/null 2>&1; then
  if [ ! -x /opt/homebrew/bin/brew ] && [ ! -x /usr/local/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

command -v chezmoi >/dev/null 2>&1 || brew install chezmoi

if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  chezmoi apply
else
  chezmoi init --apply HaRuKa-1231
fi

brew bundle --file "$HOME/.config/homebrew/Brewfile.core"

if [ "${1:-}" = "--apps" ]; then
  brew bundle --file "$HOME/.config/homebrew/Brewfile.apps"
fi

echo "setup complete"
