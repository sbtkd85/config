config
======

Linux .config/ files used on Arch

## Install

### Automatic
Clone into ~/.config/ and run the install.sh script:

    cd ~/.config/
    ./install.sh

### Manual
Clone into ~/.config/ and symlink the FileName.symlink files to ~/.FileName.

    ln -s ~/.config/vim/vimrc.symlink ~/.vimrc
    ln -s ~/.config/tmux/tmux.conf.symlink ~/.tmux.conf
    ...
