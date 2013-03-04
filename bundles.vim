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
Bundle 'MarcWeber/vim-addon-local-vimrc'

" Colorschemes
Bundle 'jeffreyiacono/vim-colors-wombat'

" PHP
Bundle 'phpfolding.vim'
Bundle 'voronkovich/vim-php-namespace'
Bundle 'voronkovich/vim-phpdoc'
Bundle 'voronkovich/php-getter-setter.vim'
" Conflicts with eclim http://eclim.org
" Bundle 'docteurklein/vim-symfony'
Bundle 'joonty/vim-phpunitqf.git'
Bundle 'evidens/vim-twig'

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
