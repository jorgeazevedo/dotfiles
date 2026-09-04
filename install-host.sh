#!/usr/bin/env bash
# Link personal config into your home directory. Run this on a Mac.
set -euo pipefail

mkdir -p ~/.config/devenv
ln -sf ~/code/jorgeazevedo/dotfiles/home/.config/devenv/devenv.yaml ~/.config/devenv/devenv.yaml
