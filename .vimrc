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

filetype plugin on

map <F2> :NERDTreeToggle<CR>
map <F3> :BufExplorer<CR>
map <F5> :!git add . && git commit<CR>
map <F6> :!git push<CR>
map <F12> :bd<CR>

colo wombat

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set number

if filereadable('~/.vim/config.vim')
    source '~/.vim/config.vim'

if filereadable(".vim")
    source .vim
endif
