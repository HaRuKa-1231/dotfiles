# zsh config layout

Files that are safe to manage with chezmoi:

- `~/.config/starship.toml`
- `path.zsh`
- `framework.zsh` - framework-level defaults
- `options.zsh`
- `prompt.zsh`
- `aliases.zsh`
- `tools.zsh`
- `completion.zsh`

Files that should stay local unless intentionally reviewed:

- `cloud.zsh` - AWS, gcloud, and cloud-account defaults
- `work.zsh` - work-account defaults that are not secrets
- `secrets.zsh` - tokens, API keys, and credentials

Avoid creating a generic `local.zsh`; it tends to become a dumping ground.

Generated completion caches such as `.zcompdump*` are not source files. Keep
them out of chezmoi; this setup writes them under `~/.cache/zsh`.
