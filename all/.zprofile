
# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

if [ -f "${HOME}/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
fi

if [ -d "${HOME}/.cargo/bin" ] ; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

# my dotfiles are here
export DOT_FILES="$HOME/.dotfiles"

# my note files
export TODAY_NOTE="$HOME/Sync/pkb/main/today.md"
export WIP_NOTE="$HOME/Sync/pkb/main/wip.md"

# default programs
if [[ -z "$TMUX" ]]; then
  export TERM='xterm-256color'
else
  # we should use this when in tmux
  # learn more at: https://rakhesh.com/linux-bsd/basic-tmux-configuration/
  export TERM='screen-256color'
fi

export TERMINAL='kitty'
export BROWSER='firefox'
# EDITOR
export EDITOR='nvim'
sdk_java_dir="~/.sdkman/candidates/java/current"
if [ -f "${sdk_java_dir}" ]; then 
    export JAVA_HOME="${sdk_java_dir}"
else
    export JAVA_HOME='/usr/lib/jvm/default'
fi

# add local bin directory to the path
export PATH="$HOME/bin:$HOME/.local/bin:$DOT_FILES/bin:$PATH"
# Adds ruby userdir to the PATH
ruby_path=$(ruby -e 'puts Gem.user_dir')/bin
export PATH="${ruby_path}:$PATH"

## Mac specific stuffs
if [ "$(uname)" = Darwin ]; then
  [ -f /opt/homebrew/sbin ] && export PATH="/opt/homebrew/sbin:$PATH"
  [ -f /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"
  [ -d /Users/mblavin/Library/Python/3.9/bin ] && export PATH="/Users/mblavin/Library/Python/3.9/bin:$PATH" 
  alias vi='nvim'
  alias vim='nvim'
  export NEOVIDE_FRAME='transparent'
else
  export NEOVIDE_FRAME='none'
fi

# create virtual env in project
export PIPENV_VENV_IN_PROJECT=1
secret_file="$HOME/.local-env"
if [ -f $secret_file ]; then
  . $secret_file
fi
