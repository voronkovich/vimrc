" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" /Vundle

"== Bundles
" Common
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'kien/ctrlp.vim'
Bundle 'voronkovich/vim-snippets'

" Colorschemes
Bundle 'jeffreyiacono/vim-colors-wombat'

" PHP
Bundle 'phpfolding.vim'
Bundle 'voronkovich/vim-php-namespace'
Bundle 'voronkovich/vim-phpdoc'
Bundle 'docteurklein/php-getter-setter.vim'
Bundle 'docteurklein/vim-symfony'
Bundle 'docteurklein/vim-phpunit'

" Snipmate and its dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

" CVS
Bundle 'tpope/vim-fugitive'
"== /Bundles

" Pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" /Pathogen
