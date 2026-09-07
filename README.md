# dotfiles

## VSCode + mise

Keep both of these `false` in VSCode user settings:

- `mise.configureExtensionsAutomatically`
- `mise.configureExtensionsIncludeGlobalTools`

With them on, the `hverlin.mise-vscode` extension writes a `.vscode/settings.json`
into *every* project you open — including ones with no `mise.toml` — because the
global tools in `~/.config/mise/config.toml` are enough to trigger it.

## Raycast

To set-up on first run
- Use cmd-space to launch raycast (just spotlight)
- Go over set up guide
- At the end pick replace cmd-space, and it should be all good

The emoji picker picker needs to set manually to ctrl-cmd-space in raycast

It'd useful to go the MacOS Keyboard shortcuts settings and disable everything
under spotlight (including "Show Finder search window")
