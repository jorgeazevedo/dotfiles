#!/usr/bin/env bash
# Everything install-host.sh does, plus the work-only apps and identity.
# Run this from the dotfiles repo root, on a work Mac.
set -euo pipefail

./install-host.sh

ln -sf "$PWD/home/.Brewfile.work" ~/.Brewfile.work

# One of the tap's casks still uses the removed `appcast` stanza, so `brew tap`
# reports a failure even though the clone itself succeeded.
brew tap guardian/devtools || true
brew trust --tap guardian/devtools

brew bundle --file ~/.Brewfile.work

mkdir -p ~/.config/gcloud/configurations
ln -sf "$PWD/home/.config/gcloud/configurations/config_default" \
	~/.config/gcloud/configurations/config_default

# Identity: work by default, overridden under ~/code/jorgeazevedo.
# Clear any personal overlay from a previous install-personal.sh run on this
# machine -- a stale one is not "missing", so git would still apply it.
rm -f ~/.config/git/config.personal
ln -sf "$PWD/home/.config/git/identity/guardian" ~/.config/git/identity/guardian
ln -sf "$PWD/home/.config/git/config.work" ~/.config/git/config.work
