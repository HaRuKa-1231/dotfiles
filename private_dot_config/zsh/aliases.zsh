alias vi="vim"

alias valias="vim ~/.config/zsh/aliases.zsh"

alias cluade="claude"
alias cl="claude"

if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons --git --git-ignore"
  alias ll="eza -l --icons --git --git-ignore"
  alias la="eza -la --icons --git --git-ignore"
  alias tree="eza -a --icons --git --git-ignore --tree"
fi

alias dcea="docker compose exec app"
alias dr="docker compose run --rm app"

alias brews="brew list -1"
alias brewsp="brew list --pinned"
alias brewp="brew pin"
alias bubo="brew update && brew outdated"
alias bubc="brew upgrade && brew cleanup"
alias bubu="bubo && bubc"

alias bell="afplay /System/Library/Sounds/Glass.aiff"

_agent-done() {
  osascript -e 'display notification "Agent work is done!" with title "Cursor"'
  afplay /System/Library/Sounds/Glass.aiff
}
alias agent-done="_agent-done"

jqi() {
  if [[ $# -eq 0 ]]; then
    fzf --print-query --preview 'jq .' <&0
  else
    fzf --print-query --preview "cat $1 | jq ." < "$1"
  fi
}

# --- git ---
git_current_branch() {
  git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null
}

alias g="git"
alias gst="git status"
alias ga="git add"
alias gaa="git add --all"
alias gap="git apply"
alias gapa="git add --patch"
alias gau="git add --update"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gc="git commit -v"
alias "gc!"="git commit -v --amend"
alias gca="git commit -v -a"
alias gcam="git commit -a -m"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gf="git fetch"
alias gfa="git fetch --all --prune"
alias gd="git diff"
alias gdca="git diff --cached"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gsh="git show"
alias gsw="git switch"
alias gswc="git switch -c"
alias gcmsg="git commit -m"
alias gl="git pull"
alias glo="git log --oneline --decorate"
alias glog="git log --oneline --decorate --graph"
alias glgg="git log --graph"
alias glgga="git log --graph --decorate --all"
alias glps="git log -p -S"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias "gpf!"="git push --force"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grs="git restore"
alias grss="git restore --source"
alias gre="git grep"
alias gss="git stash push --include-untracked -m"
alias gsta="git stash push"
alias gstp="git stash pop"
alias gstl="git stash list"
alias gup="git pull --rebase"
alias gupa="git pull --rebase --autostash"
alias gcm="git rev-parse --verify master >/dev/null 2>&1 && git checkout master || git checkout main"
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias "ggpush!"="ggpush -f"

alias gpom="git pull origin master"
alias rc_diff="git diff origin/master..HEAD --name-only | xargs bin/rubocop"
alias rc_cached="gdca --name-only | xargs bin/rubocop"
alias rs_diff="gdca --name-only | awk '/_spec/ {print $2}' | xargs bundle exec rspec"
