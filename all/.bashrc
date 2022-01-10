#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.config/shell/alias ] && source ~/.config/shell/alias
[ -f ~/.config/shell/profile ] && source ~/.config/shell/profile
[ -f ~/.profile ] && source ~/.profile

# makes history ingore dupplicate and command starting by space
export HISTCONTROL=ignoreboth
# override stuff from my default configuration
export TERMINAL='/opt/homebrew/bin/kitty'
export BROWSER='/Applications/Firefox.app/Contents/MacOS/firefox'

set -o vi
eval "$(starship init bash)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

PATH=/opt/homebrew/bin:$PATH

alias sed='gsed'

# make python 3 the default
alias python='python3'

alias vi='nvim'
alias vim='nvim'


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
