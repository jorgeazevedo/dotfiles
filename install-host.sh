#!/usr/bin/env bash
# Link personal config into your home directory.
# Run this from the dotfiles repo root, on a Mac.
set -euo pipefail

mkdir -p ~/.config/devenv
ln -sf "$PWD/home/.config/devenv/devenv.yaml" ~/.config/devenv/devenv.yaml
