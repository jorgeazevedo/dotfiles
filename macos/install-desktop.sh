#!/usr/bin/env bash
# Keep Spaces -- and with them the Dock -- where I put them.
#
# The Dock is not pinned to the main display: it follows whichever screen's
# bottom edge the cursor last pushed against. "Automatically rearrange Spaces
# based on most recent use" compounds that by reordering Spaces behind your
# back, so the Dock drifts off the external monitor on its own.
#
# The Dock has to be restarted to pick this up.
set -euo pipefail

defaults write com.apple.dock mru-spaces -bool false

killall Dock
