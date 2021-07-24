# dotfiles

My dot files, using stow 

## Modules

I split my configuration as Modules. 

* all - basic configuration should be working on any setup or OSs
* linux - Anything that works only on linux. DM configuration is a good example of what's in the linux modules.

## Special directories

Some directories are special, as not to be used as modules :

* bin : this directory is added to the path as `$DOT_FILES/bin`
