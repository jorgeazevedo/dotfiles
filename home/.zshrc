eval "$(/opt/homebrew/bin/mise activate zsh)"

# auto complete for git etc
autoload -Uz compinit
compinit
PROMPT='%D{%H:%M:%S} %1~ $ '

# Search ~/.config/recipes.md, a symlink into the dotfiles repo. With no
# argument, open it to add one.
recipe() {
  local file=~/.config/recipes.md
  if (( $# == 0 )); then
    "${EDITOR:-vi}" "$file"
    return
  fi
  # RS="" matches a whole blank-line separated block, so a hit prints the
  # command along with the line saying what it does.
  awk -v pat="$1" 'BEGIN { RS = ""; ORS = "\n\n"; pat = tolower(pat) } tolower($0) ~ pat' "$file"
}

# List all listening TCP ports
# Source: https://boreal.social/post/15-practical-bash-functions-i-use-in-my-bashrc
ports() {
  lsof -iTCP -sTCP:LISTEN -P -n
}

# Serve the current directory over HTTP; defaults to port 8000.
serve() {
  local port=${1:-8000}
  echo "Serving on http://localhost:$port"
  python3 -m http.server "$port"
}
