# Homebrew layout

Use Homebrew for machine-wide tools that are not project-versioned and are
frequently used or required by shell/Git configuration:

- macOS GUI apps and fonts
- shell experience: zsh helpers, prompt, fuzzy finder, directory jumper
- Git/GitHub base tooling
- stable command-line utilities used across projects

Use mise for tools where the version can affect project behavior or generated
output:

- Node/npm/pnpm/yarn
- Ruby/Bundler/Gems
- Python/uv
- Deno/Bun/Go
- project CLIs such as lefthook, actionlint, duckdb, vercel, gws, gemini, happy

Do not put AWS/gcloud/kubernetes account state in these Brewfiles. Install cloud
CLIs per project or machine policy, and keep credentials outside dotfiles.

Bootstrap a new machine (installs Homebrew, chezmoi, dotfiles, then
Brewfile.core; the second form also applies Brewfile.apps):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/HaRuKa-1231/dotfiles/main/setup.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/HaRuKa-1231/dotfiles/main/setup.sh)" - --apps
```

Apply manually:

```sh
brew bundle --file ~/.config/homebrew/Brewfile.core
brew bundle --file ~/.config/homebrew/Brewfile.apps
```

Avoid `brew bundle dump` as the source of truth; it captures old and transitive
state. These files are curated from command history and shell dependencies.

Current selection basis:

- frequent history: `git`, `z`, `ls`/`eza`, `bat`, `brew`, `gh`, `codex`
- zsh dependencies: `starship`, `zsh-autosuggestions`,
  `zsh-syntax-highlighting`, `zsh-completions`, `fzf`, `ripgrep`, `jq`
- Git config dependencies: `gh`, `git-lfs`, `difftastic`

Not in core unless a concrete need appears:

- `git-delta`, `gitleaks`, `fd`, `coreutils`, `shellcheck`
