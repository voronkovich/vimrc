" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" /Vundle

" Bundles
Bundle 'gmarik/vundle'
Bundle 'voronkovich/vim-phpdoc'
Bundle 'voronkovich/vim-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'phpfolding.vim'
Bundle 'voronkovich/vim-php-namespace'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'docteurklein/php-getter-setter.vim'
Bundle 'jeffreyiacono/vim-colors-wombat'
" Snipmate and its dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
" FuzzyFinder and its dependencies
" Bundle 'L9'
" Bundle 'FuzzyFinder'
Bundle 'kien/ctrlp.vim'
" /Bundles

" Pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" /Pathogen
