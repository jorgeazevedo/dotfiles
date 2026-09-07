#!/usr/bin/env bash
# Make held-down keys repeat fast, everywhere.
#
# Both values are counted in 15ms ticks, so KeyRepeat 2 is a repeat every 30ms
# and InitialKeyRepeat 15 waits 225ms before the first repeat. These are the fast
# ends of the System Settings > Keyboard sliders; 1 and 10 go faster still than
# the UI allows.
#
# Apps read these at launch, so log out and back in for them to take effect
# everywhere.
set -euo pipefail

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Otherwise holding a key in Cocoa apps (VSCode, IntelliJ) opens the accent
# picker instead of repeating.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
