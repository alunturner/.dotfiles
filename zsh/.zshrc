export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. Requires nerdfont installed.
# Location followed by git branch (if available).
# Prompt is $ for regular or # for elevated privilege.
NEWLINE=$'\n'
PROMPT='%F{blue}IN %~%f %F{green}$(git_branch_name)%f$NEWLINE%(!.#.$) '

if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi

# Make lazygit look in the right place for config nb only required for mac
export LG_CONFIG_FILE="$HOME/.config/lazygit/lazygit.conf"
