#!/usr/bin/env bash
# Link personal config into your home directory.
# Run this from the dotfiles repo root, on a Mac.
set -euo pipefail

mkdir -p ~/.config/devenv
ln -sf "$PWD/home/.config/devenv/devenv.yaml" ~/.config/devenv/devenv.yaml

mkdir -p ~/.config/mise
ln -sf "$PWD/home/.config/mise/config.toml" ~/.config/mise/config.toml

ln -sf "$PWD/home/.zshrc" ~/.zshrc

ln -sf "$PWD/home/.Brewfile" ~/.Brewfile

brew bundle --global
