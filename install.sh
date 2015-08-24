#!/usr/bin/env bash

SCRIPT_DIRECTORY=$(dirname $0)

cd "$SCRIPT_DIRECTORY/.."

[ ! -d "autoload" ] && mkdir "autoload"
[ ! -d "bundle" ] && mkdir "bundle"

ln -s "$SCRIPT_DIRECTORY/vimrc" "$HOME/.vimrc"

cd bundle
rm -rf *

git clone https://github.com/VundleVim/Vundle.vim

vim +BundleInstall +qall
