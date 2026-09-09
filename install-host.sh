#!/usr/bin/env bash
# Link shared config into your home directory.
# Run this from the dotfiles repo root, on a Mac.
# Prefer install-personal.sh or install-work.sh -- neither identity nor the
# machine-only apps are set up by this script alone.
set -euo pipefail

mkdir -p ~/.config/devenv
ln -sf "$PWD/home/.config/devenv/devenv.yaml" ~/.config/devenv/devenv.yaml

mkdir -p ~/.config/mise
ln -sf "$PWD/home/.config/mise/config.toml" ~/.config/mise/config.toml

# All git config lives under ~/.config/git. Git only honours it while
# ~/.gitconfig is absent: if both exist it reads both, and ~/.gitconfig wins for
# single-valued settings such as user.email.
if [ -L ~/.gitconfig ]; then
	rm -f ~/.gitconfig
elif [ -e ~/.gitconfig ]; then
	echo "warning: ~/.gitconfig exists and will override ~/.config/git/config" >&2
	echo "         move it aside, then re-run this script" >&2
fi

mkdir -p ~/.config/git/identity
ln -sf "$PWD/home/.config/git/ignore" ~/.config/git/ignore
ln -sf "$PWD/home/.config/git/config" ~/.config/git/config
# Used by both machine classes, for ~/code/jorgeazevedo.
ln -sf "$PWD/home/.config/git/identity/jorgeazevedo" ~/.config/git/identity/jorgeazevedo

# Only link skills and instructions: Copilot owns the rest of ~/.copilot
# (config.json, ide, logs).
# ln refuses to replace a real directory and would link inside it instead.
mkdir -p ~/.copilot
rm -rf ~/.copilot/skills
ln -sfn "$PWD/home/.copilot/skills" ~/.copilot/skills
ln -sf "$PWD/home/.copilot/copilot-instructions.md" ~/.copilot/copilot-instructions.md

ln -sf "$PWD/home/.zshrc" ~/.zshrc

ln -sf "$PWD/home/.gvimrc" ~/.gvimrc

ln -sf "$PWD/home/.Brewfile" ~/.Brewfile

./macos/install-terminal.sh
./macos/install-keyboard.sh
./macos/install-desktop.sh

brew bundle --global --no-upgrade
