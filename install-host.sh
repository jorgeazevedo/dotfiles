#!/usr/bin/env bash
# Link personal config into your home directory.
# Run this from the dotfiles repo root, on a Mac.
set -euo pipefail

mkdir -p ~/.config/devenv
ln -sf "$PWD/home/.config/devenv/devenv.yaml" ~/.config/devenv/devenv.yaml

mkdir -p ~/.config/mise
ln -sf "$PWD/home/.config/mise/config.toml" ~/.config/mise/config.toml

mkdir -p ~/.config/git
ln -sf "$PWD/home/.config/git/ignore" ~/.config/git/ignore

ln -sf "$PWD/home/.zshrc" ~/.zshrc

ln -sf "$PWD/home/.gvimrc" ~/.gvimrc

ln -sf "$PWD/home/.Brewfile" ~/.Brewfile

./macos/install-terminal.sh

brew bundle --global
