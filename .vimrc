" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" /Vundle

" Bundles
Bundle 'voronkovich/phpdoc.vim'
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

filetype plugin indent on

" My settings
map <F2> :NERDTreeToggle<CR>
map <F3> :BufExplorer<CR>
map <F5> :!git add . && git commit<CR>
map <F6> :!git push<CR>
map <F12> :bd<CR>

" PHPDoc
au FileType php inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
au FileType php nnoremap <C-P> :call PhpDocSingle()<CR>
au FileType php vnoremap <C-P> :call PhpDocRange()<CR>

colo wombat

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set number

if filereadable(".vim")
    source .vim
endif
