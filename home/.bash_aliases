# Stop the AWS CLI piping output into a pager.
export AWS_PAGER=""
unset GIT_EDITOR

# Give gh the token VS Code forwards via git; needs `gh auth setup-git` on the host.
export GH_TOKEN=$(echo url=https://github.com | GIT_TERMINAL_PROMPT=0 git credential fill | sed -n 's/^password=//p')

# Turn on ** pattern matching
shopt -s globstar

# Mirrors snippets() in .zshrc. ~/.config/snippets.md is a copy here, so edits are lost.
snippets() {
  local file=~/.config/snippets.md
  if (( $# == 0 )); then
    "${EDITOR:-vi}" "$file"
    return
  fi
  awk -v pat="$1" 'BEGIN { RS = ""; ORS = "\n\n"; pat = tolower(pat) } tolower($0) ~ pat' "$file"
} 