" Bundles {{{

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Common
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'kien/ctrlp.vim'
Bundle 'voronkovich/vim-snippets'
Bundle 'MarcWeber/vim-addon-local-vimrc'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline'
Bundle 'mileszs/ack.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-surround'

" Colorschemes
Bundle 'jeffreyiacono/vim-colors-wombat'

" Code complition
" Bundle 'Valloric/YouCompleteMe'

" Snippets
Bundle 'SirVer/ultisnips'

" PHP
Bundle 'phpfolding.vim'
Bundle 'voronkovich/vim-phpdoc'
Bundle 'voronkovich/vim-phpunit-snippets'
Bundle 'voronkovich/php-getter-setter.vim'
" Conflicts with eclim http://eclim.org
" Bundle 'docteurklein/vim-symfony'
Bundle 'joonty/vim-phpunitqf.git'
Bundle 'evidens/vim-twig'

" Html
Bundle 'mattn/zencoding-vim'

" MODX
Bundle 'rosstimson/modx.vim'

" ZSH highlighting
Bundle 'clones/vim-zsh'

" Puppet
Bundle 'rodjek/vim-puppet'

" CVS
Bundle 'tpope/vim-fugitive'
" }}}

filetype plugin indent on

let mapleader = ","

" Disable <Arrow keys>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

" By default <Space> is equal 'l'
nmap <Space> h

" Write file with root permissions
command Sw w !sudo tee %

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set laststatus=2

" Run foreign command
nmap \ :!
" http://powdahound.com/2009/05/execute-current-file-in-vim
function! RunShebang()
    if (match(getline(1), '^\#!') == 0)
        :!./%
    else
        echo "No shebang in this file."
    endif
endfunction
nmap <leader>ru :call RunShebang()<CR>

" Code autocompletion with eclim
if has("gui_running")
    inoremap <C-Space> <C-x><C-u>
else
    inoremap <Nul> <C-x><C-u>
endif

" Substitute
nnoremap <leader>s :%s//<left>
function! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with: ")
    :exe '%s/\<' . expand('<cword>') . '\>/' .  s:word . '/gce'
    :unlet! s:word
endfunction
nnoremap <leader>r :call Replace()<CR>

" Centering search result
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

" Ultisnips
let g:UltiSnipsSnippetDirectories=["snippets", "UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" NERDTree
nmap <BS> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Go to definition
au FileType php nnoremap gD :PhpSearchContext<CR>

" Working with buffers
nmap <Leader>l :BufExplorer<CR>
nmap <Leader>d :bd<CR>
nmap <Leader>bj :bn<CR>
nmap <Leader>bk :bp<CR>
nmap <C-h> <C-^> " Toggle between two buffers

" Ack
nmap <Leader>a :Ack 

" Saving by Ctrl+s
map <C-S> <Esc>:w<CR> " Add: alias vim="stty stop '' -ixoff ; vim" in your bash aliases
imap <C-s> <Esc>:w<CR>

" File templates
autocmd! BufNewFile * silent! 0r ~/.vim/vimrc/templates/template.%:e

" PHPDoc
let g:pdv_cfg_Author = "Oleg Voronkovich <oleg-voronkovich@yandex.ru>"
let g:pdv_cfg_License = "GNU LGPL 3 or above"
let g:pdv_cfg_Copyright = strftime("%Y")." by Oleg Voronkovich <oleg-voronkovich@yandex.ru>"

au FileType php inoremap <Leader>pd <ESC>:call PhpDocSingle()<CR>i
au FileType php nnoremap <Leader>pd :call PhpDocSingle()<CR>
au FileType php vnoremap <Leader>pd :call PhpDocRange()<CR>

" Git 
nmap <Leader>gc :Git 
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>

" PHPUnit
au FileType php nnoremap <Leader>tc :Test 
au FileType php nnoremap <Leader>ta :Test<CR>
au FileType php nnoremap <Leader>tf :Test %<CR>

" CtrlP
let g:ctrlp_by_filename = 1

" Easy motion
let g:EasyMotion_leader_key = '<Leader>'

" PHP getset plugin
let g:phpgetset_getterTemplate =
            \ "    \n" .
            \ "    public function %funcname%()\n" .
            \ "    {\n" .
            \ "        return $this->%varname%;\n" .
            \ "    }"
let g:phpgetset_setterTemplate =
            \ "    \n" .
            \ "    public function %funcname%($%varname%)\n" .
            \ "    {\n" .
            \ "        $this->%varname% = $%varname%;\n" .
            \ "    }"

colo wombat

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set number
" vim: foldmethod=marker
