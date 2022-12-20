source ~/.zprofile

## Mac specific stuffs
if [ "$(uname)" = Darwin ]; then
  [ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"
  [ -d /opt/homebrew/sbin ] && export PATH="/opt/homebrew/sbin:$PATH"
  [ -f /opt/homebrew/opt/openjdk@11/bin ] && export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/
  alias vi='nvim'
  alias vim='nvim'
  export NEOVIDE_FRAME='transparent'
fi

