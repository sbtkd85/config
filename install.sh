#!/bin/sh
#
# This will "install" the config files
# for the current user in $HOME.
# Basically, it creates the appropriate
# symbolic links to setup the various applications.
#

# Variables
CONFIG="$HOME/.config"
EXT="*.symlink"

# Functions

# Brief: Function to create system links
function create_symlinks()
{
    # List of all files to link
    files=`find . -name $EXT`

    # Now we deal with individual files from the list
    for path in $files
    do
        # Get directory
        basedir=`echo $path | awk 'BEGIN {FS="/"}{print $2}'`
        # Get filename
        filename=`echo $path | awk 'BEGIN {FS="/"}{print $3}'`
        #file=`echo $file | awk 'BEGIN {FS="."}{print $1}'`
        # Get filename without .symlink
        file="${filename%.*}"

        # Deal with existing files
        backup_existing $file

        # Create the link
        ln -s "$CONFIG/$basedir/$filename" "$HOME/.$file"
    done
}

# Brief: Function to backup existing files
# Param: Filename to check & backup
function backup_existing()
{
    if [ -L "$HOME/.$1" ]; then
        echo "  Removing symlinked $1"
        rm "$HOME/.$1"
    elif [ -f "$HOME/.$1" ]; then
        echo "  Backing up ~/.$1"
        mv "$HOME/.$1" "$HOME/.$1.bk"
    fi
}

# Brief: Error function called on bad execution
#        paths to warn user and exit
# Param: String to print prior to exit
function error_exit()
{
    echo "  ERROR: $1"
    echo
    exit 1
}

# Brief: Function to update git submodules
function update_submodules()
{
    if [ $PWD != $CONFIG ]; then
        echo $PWD
        echo $CONFIG
        error_exit "Must be run from ~/.config directory"
    fi

    git submodule init
    git submodule update
}

# Brief: Main function that starts script
function main()
{
    echo
    echo "  Existing rc files will be backed up using .bk extension"
    echo "  Existing symlinks will be deleted!!!"
    echo

    # First update submodules
    update_submodules

    # Then create symlinks
    create_symlinks

    # Finally complete additional links/steps
    if [ -L "$HOME/.dir_colors" ]; then
        rm "$HOME/.dir_colors"
    elif [ -f "$HOME/.dir_colors" ]; then
        mv "$HOME/.dir_colors" "$HOME/.dir_colors.bk"
    fi
    ln -s "$CONFIG/themes/dircolors-solarized/dircolors.ansi-dark" "$HOME/.dir_colors"

    echo "  Done!"
    echo
    exit 0
}

# Start
main
