#
# ~/.bash_profile
#

[[ -f "${HOME}"/.bashrc ]] && . "${HOME}"/.bashrc
[[ -d "${HOME}/.cargo/env" ]] && "${HOME}/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
