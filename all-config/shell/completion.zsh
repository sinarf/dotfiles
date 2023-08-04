# COMPLETION
autoload -Uz compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
# autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

### completion system
# load module for list-style selection
zmodload zsh/complist

# use the module above for autocomplete selection
zstyle ':completion:*' menu select

# complete sudo commnands
zstyle ':completion::complete:*' gain-privileges 1

# now we can define keybindings for complist module
# you want to trigger search on autocomplete items
# so we'll bind some key to trigger history-incremental-search-forward function
bindkey -M menuselect '?' history-incremental-search-forward
