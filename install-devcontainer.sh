#!/usr/bin/env bash
# Run by devenv inside the devcontainer, from this repo's root.
set -euo pipefail

sudo apt-get update -y
sudo apt-get install -y vim

# The Debian ~/.bashrc sources ~/.bash_aliases if it exists.
cp home/.bash_aliases ~/.bash_aliases

mkdir -p ~/.config/git
cp -R home/.config/git/. ~/.config/git/

mkdir -p ~/.copilot
cp -R home/.copilot/. ~/.copilot/