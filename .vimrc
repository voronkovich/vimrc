" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on
" /Vundle

" Bundles
Bundle 'voronkovich/vim-configuration'
Bundle 'voronkovich/phpdoc.vim'
Bundle 'voronkovich/vim-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'docteurklein/php-getter-setter.vim'
Bundle 'jeffreyiacono/vim-colors-wombat'

" Snipmate and dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
" /Bundles

if filereadable('~/.vim/config.vim')
    source '~/.vim/config.vim'
endif

if filereadable(".vim")
    source .vim
endif
