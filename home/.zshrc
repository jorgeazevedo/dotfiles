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

# Shell on an EC2 instance by id: sshi <instance-id> <profile>
# Replaces the deprecated guardian/ssm-scala `ssm ssh`; needs the
# session-manager-plugin cask.
sshi() {
  aws --profile "$2" --region "${AWS_REGION:-eu-west-1}" \
    ssm start-session --target "$1"
}

# Same, but resolve the newest running instance from its tags:
# ssha <app> <stage> <profile>
ssha() {
  local profile="$3"
  local instance

  instance=$(aws --profile "$profile" --region "${AWS_REGION:-eu-west-1}" ec2 describe-instances \
    --filters "Name=tag:App,Values=$1" "Name=tag:Stage,Values=$2" \
      "Name=instance-state-name,Values=running" \
    --query 'Reservations[].Instances[] | sort_by(@, &LaunchTime)[-1].InstanceId' \
    --output text --no-cli-pager)

  if [[ -n "$instance" && "$instance" != "None" ]]; then
    sshi "$instance" "$profile"
    return
  fi

  echo "Could not find any instance tagged App=$1 Stage=$2 in $profile"
  echo "\nInstances with a similar App tag:"
  aws --profile "$profile" --region "${AWS_REGION:-eu-west-1}" ec2 describe-instances \
    --filters "Name=tag:App,Values=*$1*" \
    --query 'Reservations[].Instances[].[InstanceId, Tags[?Key==`App`]|[0].Value, Tags[?Key==`Stack`]|[0].Value, Tags[?Key==`Stage`]|[0].Value, LaunchTime]' \
    --output text --no-cli-pager | column -t
  return 1
}

# Tab completion for the <profile> argument.
_aws_profiles() { compadd ${(f)"$(aws configure list-profiles)"} }
_sshi() { _arguments ':instance id:' ':profile:_aws_profiles' }
_ssha() { _arguments ':app:' ':stage:' ':profile:_aws_profiles' }
compdef _sshi sshi
compdef _ssha ssha
