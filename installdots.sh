#!/bin/bash
##########Variables
 
dir=$HOME/dotfiles                    # dotfiles directory
olddir=$HOME/dotfiles_old             # old dotfiles backup directory
#files=".zshrc .vimrc .muttrc .offlineimaprc .tmux.conf .msmtprc .colorsmuttrc .gitconfig"        # list of files/folders to symlink in homedir
files=".gitconfig .muttrc .zshrc .vimrc .offlineimaprc .msmtprc"        # list of files/folders to symlink in homedir
 
##########
 
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in $HOME"
mkdir -p $olddir
echo "...done"
 
# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from $HOME to $olddir"
    mv $HOME/$file $HOME/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    #echo "${file:1}" 
    ln -s $dir/${file:1} $HOME/$file
done
 
#source $HOME/.zshrc

