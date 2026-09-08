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


## Migrating files across

Best to use rsync v3 (already installed via homebrew) rather than the built-in rsync v2

```bash
rsync -aHAX --partial --progress \
  --rsync-path=/opt/homebrew/bin/rsync \
  --exclude 'node_modules/' --exclude '.venv/' --exclude '._*' \
  ~/code/ user@192.168.0.1:~/code/
```

On the target mac the following commands will be useful
```bash
sudo systemsetup -setremotelogin on          # or System Settings ▸ General ▸ Sharing ▸ Remote Login
scutil --get LocalHostName
ipconfig getifaddr en0
whoami      
```
