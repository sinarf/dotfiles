setfont ter-p32b

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# my dotfiles are here
export DOT_FILES="$HOME/.dotfiles"

# my note files
export TODAY_NOTE="$HOME/Sync/pkb/main/today.md"
export WIP_NOTE="$HOME/Sync/pkb/main/wip.md"

# default programs
if [[ -z "$TMUX" ]] 
then 
    export TERM='xterm-256color' 
else
    # we should use this when in tmux
    # learn more at: https://rakhesh.com/linux-bsd/basic-tmux-configuration/
    export TERM='screen-256color' 
fi

export TERMINAL='kitty'
export BROWSER='firefox'
# EDITOR
if (which neovide) ; then
  export VISUAL='neovide'
else
  export VISUAL="$TERMINAL -e nvim"
fi
export EDITOR='nvim'

export JAVA_HOME='/usr/lib/jvm/default'

# Use bash-completion, if available
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# add local bin directory to the path
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$DOT_FILES/bin"
# Adds ruby userdir to the PATH
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

export PATH="$PATH:~/.cargo/bin"
