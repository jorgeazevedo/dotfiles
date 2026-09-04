eval "$(/opt/homebrew/bin/mise activate zsh)"

# auto complete for git etc
autoload -Uz compinit
compinit
PROMPT='%D{%H:%M:%S} %1~ $ '
