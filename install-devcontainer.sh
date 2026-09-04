#!/usr/bin/env bash
# Run by devenv inside the devcontainer, from this repo's root.
set -euo pipefail

sudo apt-get update -y
sudo apt-get install -y vim

# The Debian ~/.bashrc sources ~/.bash_aliases if it exists.
cp home/.bash_aliases ~/.bash_aliases
