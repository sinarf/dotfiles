# dotfiles

My dot files, using stow

## Modules

I split my configuration as Modules.

- all - basic configuration should be working on any setup or OSs
- linux - Anything that works only on linux. DM configuration is a good example of what's in the linux modules.
- mac - Anything I only use on mac

## Special directories

Some directories are special, as not to be used as modules :

- `bin` ==> this directory is added to the path as `$DOT_FILES/bin`
- `softwares` ==> this directory contains text files with a lists of softwares to install, with the `$DOT_FILES/bin/install_all_software.sh`
- `init` ==> contains script to initialize an arch installation and setup dotfiles.
