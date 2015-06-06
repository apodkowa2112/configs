#!/bin/bash
# Links in the configs into your home directory
# WARNING: May overwrite files.  Use at your own risk!

# Get current directory
dir=`pwd`

# Get list of files
files=`ls -a1 | grep -vE '(\.$|\.git|LICENSE|autolink.sh)'`

# Echo files
echo These files will be linked into your home directory:
echo $files
echo Continue?

for file in $files
do
   cmd="ln -s $dir/$file ~/$file"
   echo $cmd
done

# Clone .oh-my-zsh
cmd="git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh/"
echo $cmd

# vim: ts=3:sw=3:expandtab:smartindent
