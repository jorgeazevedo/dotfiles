#!/usr/bin/env bash
# Set the Terminal.app font and default profile.
#
# This drives Terminal's own AppleScript interface rather than writing its
# preferences behind its back, so Terminal needs to be running - osascript
# launches it if it isn't.
set -euo pipefail

osascript <<'APPLESCRIPT'
tell application "Terminal"
	set font name of settings set "Pro" to "SourceCodePro-Regular"
	set font size of settings set "Pro" to 14
	set default settings to settings set "Pro"
	set startup settings to settings set "Pro"
end tell
APPLESCRIPT
