#
# ~/.bashrc
#
PATH=/opt/homebrew/bin:$PATH

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f "${HOME}/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.config/shell/alias ] && source ~/.config/shell/alias
[ -f ~/.config/shell/profile ] && source ~/.config/shell/profile
[ -f ~/.profile ] && source ~/.profile

# makes history ingore dupplicate and command starting by space
export HISTCONTROL=ignoreboth
# override stuff from my default configuration

export BROWSER='/Applications/Firefox.app/Contents/MacOS/firefox'

set -o vi
if command -v starship > /dev/null; then
  eval "$(starship init bash)"
fi

if command -v brew > /dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi



alias ls='ls --color=auto'
# make python 3 the default
alias python='python3'

alias vi='nvim'
alias vim='nvim'


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
