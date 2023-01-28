
# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

if [ -f "${HOME}/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
fi

if [ -d "${HOME}/.cargo/bin" ] ; then
  export PATH="$PATH:~/.cargo/bin"
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
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$DOT_FILES/bin"
# Adds ruby userdir to the PATH
ruby_path=$(ruby -e 'puts Gem.user_dir')/bin
export PATH="${ruby_path}:$PATH"

export NEOVIDE_FRAME='none'

## Mac specific stuffs
if [ "$(uname)" = Darwin ]; then
  [ -f /opt/homebrew/sbin ] && export PATH="/opt/homebrew/sbin:$PATH"
  [ -f /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"
  [ -f /opt/homebrew/opt/openjdk@11/bin ] && export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/
  alias vi='nvim'
  alias vim='nvim'
fi

secret_file="$HOME/.local-env"
if [ -f $secret_file ]; then
  . $secret_file
fi
