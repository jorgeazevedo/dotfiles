#!/usr/bin/env bash
# Everything install-host.sh does, plus the personal-only apps.
# Run this from the dotfiles repo root, on a personal Mac.
set -euo pipefail

./install-host.sh

ln -sf "$PWD/home/.Brewfile.personal" ~/.Brewfile.personal

brew bundle --file ~/.Brewfile.personal
