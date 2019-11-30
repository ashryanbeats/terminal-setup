#!/bin/zsh
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/terminal-setup/dotfiles         # dotfiles directory
olddir=~/dotfiles_old           # old dotfiles backup directory
files=("zshrc.sh" "jshintrc.json")      # list of files/folders to symlink in homedir

##########

create_dot_files () {
    if [ ! -f /bin/zsh -o -f /usr/bin/zsh ]; then
        echo "Run installzsh.sh to install zsh first, then run this script."
        exit 1
    fi

    # create dotfiles_old in homedir
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p $olddir
    echo "done"

    # change to the dotfiles directory
    echo -n "Changing to the $dir directory ..."
    cd $dir
    echo "done"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
    echo "Moving any existing dotfiles from $HOME to $olddir"

    for file in $files; do
        filename=${file%.*}
        if [[ -e ~/.$filename ]]; then
            mv ~/.$filename ~/dotfiles_old/
        fi

        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$filename
    done
}

create_dot_files