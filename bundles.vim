" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" /Vundle

" Bundles
Bundle 'voronkovich/vim-phpdoc'
Bundle 'voronkovich/vim-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'docteurklein/php-getter-setter.vim'
Bundle 'jeffreyiacono/vim-colors-wombat'
" Snipmate and its dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
" /Bundles

" Pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" /Pathogen
