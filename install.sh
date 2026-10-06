#!/usr/bin/env bash
# Run inside the devcontainer, from this repo's root. VS Code Dev Containers
# picks it up by name (dotfiles.repository in settings.json); devenv.yaml names
# it explicitly.
set -euo pipefail

sudo apt-get update -y
sudo apt-get install -y vim

# The Debian ~/.bashrc sources ~/.bash_aliases if it exists.
cp home/.bash_aliases ~/.bash_aliases

mkdir -p ~/.config/git
cp -R home/.config/git/. ~/.config/git/

mkdir -p ~/.copilot
cp -R home/.github/. ~/.copilot/