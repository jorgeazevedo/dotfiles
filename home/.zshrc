eval "$(/opt/homebrew/bin/mise activate zsh)"

# auto complete for git etc
autoload -Uz compinit
compinit
PROMPT='%D{%H:%M:%S} %1~ $ '

# List all listening TCP ports
# Source: https://boreal.social/post/15-practical-bash-functions-i-use-in-my-bashrc
ports() {
  lsof -iTCP -sTCP:LISTEN -P -n
}
