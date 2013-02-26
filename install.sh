#!/bin/bash
VIMDIR="$HOME/.vim"
cd $VIMDIR;

if [ ! -d "autoload"  ]; then
    mkdir "autoload"
fi;

if [ ! -d "bundle"  ]; then
    mkdir "bundle"
fi;

ln -s $VIMDIR/vimrc/vimrc $HOME/.vimrc

# Install pathogen
curl -Sso autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;

cd bundle;
rm -rf *;

# Install Vundle
git clone https://github.com/gmarik/vundle.git;

vim -u "$VIMDIR/vimrc/bundles.vim" +BundleInstall +qall;
