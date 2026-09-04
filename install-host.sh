#!/usr/bin/env bash
# Link personal config into your home directory. Run this on a Mac.
set -euo pipefail

# The folder this script lives in.
repo="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/devenv
ln -sf "$repo/home/.config/devenv/devenv.yaml" ~/.config/devenv/devenv.yaml
