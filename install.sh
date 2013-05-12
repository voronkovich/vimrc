#!/usr/bin/env bash

SCRIPT_DIRECTORY=$(dirname $(readlink -f $0))

cd $SCRIPT_DIRECTORY/..

if [ ! -d "autoload"  ]; then
    mkdir "autoload"
fi;

if [ ! -d "bundle"  ]; then
    mkdir "bundle"
fi;

ln -s $SCRIPT_DIRECTORY/vimrc $HOME/.vimrc

cd bundle;
rm -rf *;

# Install Vundle
git clone https://github.com/gmarik/vundle.git;

vim +BundleInstall +qall;
