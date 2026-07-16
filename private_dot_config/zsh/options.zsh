bindkey -e

autoload -Uz colors
colors

setopt print_eight_bit
setopt no_beep
setopt nolistbeep
setopt auto_pushd
setopt share_history
setopt hist_ignore_dups

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
