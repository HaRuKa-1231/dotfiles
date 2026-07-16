# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

Bootstrap a new Mac (installs Homebrew, chezmoi, applies dotfiles, then
`brew bundle` with Brewfile.core):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/HaRuKa-1231/dotfiles/main/setup.sh)"
```

Also install GUI apps (Brewfile.apps):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/HaRuKa-1231/dotfiles/main/setup.sh)" - --apps
```

The script is idempotent: on a machine that already has everything, it pulls
the latest dotfiles, re-applies them, and re-runs `brew bundle`.

## Layout

- `dot_zshrc` — thin entrypoint; real config is split under `~/.config/zsh/`
- `private_dot_config/zsh/` — zsh config by concern (see its README;
  `secrets.zsh`, `cloud.zsh`, `work.zsh` stay machine-local and unmanaged)
- `private_dot_config/homebrew/` — curated Brewfiles (see its README for the
  Homebrew vs mise split)
- `private_dot_config/starship.toml` — prompt
- `dot_vimrc` — vim

## Day-to-day

```sh
chezmoi edit ~/.zshrc   # edit the source, then
chezmoi apply           # apply to $HOME
chezmoi update          # pull latest from this repo and apply
```
