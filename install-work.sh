#!/usr/bin/env bash
# Everything install-host.sh does, plus the work-only apps.
# Run this from the dotfiles repo root, on a work Mac.
set -euo pipefail

./install-host.sh

ln -sf "$PWD/home/.Brewfile.work" ~/.Brewfile.work

brew bundle --file ~/.Brewfile.work
