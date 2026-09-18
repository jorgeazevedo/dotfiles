#!/usr/bin/env bash
# Download Chrome extensions that aren't on the Web Store, for loading unpacked.
#
# Chrome derives an unpacked extension's ID from its path, so DEST must not move:
# a new path costs you the load-unpacked step and the granted host permissions.
set -euo pipefail

DEST=~/.local/share/chrome-extensions
mkdir -p "$DEST"

curl -fsSL -o "$DEST/jsontree.zip" \
	https://github.com/ceno/jsontree/releases/download/v2026.09.17b3/jsontree-extension-2026.09.17b3.zip
rm -rf "$DEST/jsontree"
unzip -q "$DEST/jsontree.zip" -d "$DEST"
rm -f "$DEST/jsontree.zip"

echo "Unless already loaded: chrome://extensions > Developer mode > Load unpacked > $DEST/jsontree"
