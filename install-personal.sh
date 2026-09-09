#!/usr/bin/env bash
# Everything install-host.sh does, plus the personal-only apps and identity.
# Run this from the dotfiles repo root, on a personal Mac.
set -euo pipefail

./install-host.sh

ln -sf "$PWD/home/.Brewfile.personal" ~/.Brewfile.personal

brew bundle --file ~/.Brewfile.personal --no-upgrade

# Identity: ceno by default, overridden under ~/code/jorgeazevedo.
# Clear any work overlay from a previous install-work.sh run on this machine --
# a stale one is not "missing", so git would apply it and it would win.
rm -f ~/.config/git/config.work
ln -sf "$PWD/home/.config/git/identity/ceno" ~/.config/git/identity/ceno
ln -sf "$PWD/home/.config/git/config.personal" ~/.config/git/config.personal
