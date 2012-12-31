source ~/.vim/vimrc/bundles.vim
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
