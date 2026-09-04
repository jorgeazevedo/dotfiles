#!/usr/bin/env bash
# Run on a Mac to install personal host config (e.g. devenv user config).
# Symlinks files tracked under home/ into $HOME, backing up any existing files.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$DOTFILES_DIR/home/.config/devenv/devenv.yaml"
DEST="$HOME/.config/devenv/devenv.yaml"

mkdir -p "$(dirname "$DEST")"

if [ -e "$DEST" ] && [ ! -L "$DEST" ]; then
  mv "$DEST" "$DEST.bak.$(date +%Y%m%d-%H%M%S)"
fi

ln -sf "$SRC" "$DEST"
echo "Linked $DEST -> $SRC"
