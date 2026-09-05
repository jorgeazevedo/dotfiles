# dotfiles

## VSCode + mise

Keep both of these `false` in VSCode user settings:

- `mise.configureExtensionsAutomatically`
- `mise.configureExtensionsIncludeGlobalTools`

With them on, the `hverlin.mise-vscode` extension writes a `.vscode/settings.json`
into *every* project you open — including ones with no `mise.toml` — because the
global tools in `~/.config/mise/config.toml` are enough to trigger it.