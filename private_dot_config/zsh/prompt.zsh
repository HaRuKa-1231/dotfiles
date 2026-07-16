[[ -o interactive ]] || return

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
  return
fi

PROMPT='%F{blue}%~%f
%F{green}❯%f '
RPROMPT='%F{yellow}$(TZ=Asia/Tokyo date "+%Y-%m-%d %H:%M")%f'
