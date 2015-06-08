" Bundles {{{ " Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Common
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'nixprime/cpsm'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'kassio/ctrlp-bufline.vim'
Bundle 'voronkovich/ctrlp-nerdtree.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'ervandew/ag'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-surround'
Bundle 'embear/vim-localvimrc'
Bundle 'tobyS/vmustache'
Bundle 'Yggdroot/indentLine'
Bundle 'xolox/vim-misc'

" Colorschemes
Bundle 'xolox/vim-colorscheme-switcher'
Bundle 'vim-scripts/wombat256.vim'
Bundle 'flazz/vim-colorschemes'

" Comments
Bundle 'tpope/vim-commentary'

" Code completion
" Bundle 'Valloric/YouCompleteMe'

" Snippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'voronkovich/my-vim-snippets'
Bundle 'algotech/ultisnips-php'

" PHP
Bundle 'StanAngeloff/php.vim'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'rayburgemeestre/phpfolding.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'voronkovich/ctrlp-symfony2.vim'
" Bundle 'voronkovich/vim-phpdoc'
Bundle 'voronkovich/vim-composer-open-class-file'
Bundle 'tobyS/pdv'
Bundle 'voronkovich/vim-phpunit-snippets'
Bundle 'voronkovich/php-getter-setter.vim'
" Conflicts with eclim http://eclim.org
Bundle 'docteurklein/vim-symfony'
Bundle 'joonty/vim-phpunitqf.git'
Bundle 'evidens/vim-twig'
" Bundle 'm2mdas/phpcomplete-extended'
" Bundle 'm2mdas/phpcomplete-extended-symfony'
Bundle 'arnaud-lb/vim-php-namespace'

" JavaScript
" Bundle 'marijnh/tern_for_vim'

" Html
Bundle 'Valloric/MatchTagAlways'
Bundle 'mattn/emmet-vim'

" ZSH highlighting
Bundle 'clones/vim-zsh'

" Fish
Bundle 'dag/vim-fish'

" Puppet
Bundle 'rodjek/vim-puppet'

" CVS
Bundle 'tpope/vim-fugitive'

" }}}

" Common settings {{{1
filetype plugin indent on

let mapleader = ","

nnoremap ; :

nmap <C-z> <Nop>

" Colorscheme
set t_Co=256
set background=dark
colo earth

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set number

" Jump to an end of a string
inoremap ,a <C-o>A

" Disable <Arrow keys> {{{
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
" }}}

" Centering search result {{{2
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
" 2}}}

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

" Write file with root permissions
command! W w !sudo tee %

" Working with buffers {{{2
nmap <Leader>l :CtrlPBuffer<CR>
nmap <Space>l :CtrlPBuffer<CR>
nmap <Leader>d :bd<CR>
nmap <Leader>bj :bn<CR>
nmap <Leader>bk :bp<CR>
nmap <C-h> <C-^> " Toggle between two buffers
" 2}}}

" Substitute functions {{{2
nnoremap <leader>s :%s//<left>
function! Replace(string)
    let replace = input("Replace " . a:string . " with: ")
    :exe '%s/\<' . a:string . '\>/' .  replace
endfunction
nnoremap <leader>r :call Replace(expand('<cword>'))<CR>
nnoremap <leader>R :call Replace(expand('<cWORD>'))<CR>
" 2}}}
" 1}}}

" Eclim {{{
" Code autocompletion with eclim
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
"let g:EclimCompletionMethod = 'omnifunc'
au FileType php noremap <silent> <buffer> \ :PhpSearchContext<cr>
nnoremap <Leader>pc :ProjectCreate 
nnoremap <Leader>pl :ProjectList<CR>
" }}}

" Ultisnips {{{
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}

" Airline
set laststatus=2

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" NERDTree
nmap <BS> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Ag
nmap <Leader>a :Ag 

" Saving by Ctrl+s
map <C-a> <Esc>:w<CR> " Add: alias vim="stty stop '' -ixoff ; vim" in your bash aliases
imap <C-a> <Esc>:w<CR>

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

" CtrlP {{{
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'max:20'
let g:ctrlp_working_path_mode = 0
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -iU --nocolor --nogroup --hidden
          \ --ignore .git
          \ --ignore .svn
          \ --ignore .hg
          \ --ignore .DS_Store
          \ --ignore "**/.*.swp"
          \ --ignore "**/*.pyc"
          \ --ignore "app/cache"
          \ --ignore "bin"
          \ --ignore "build"
          \ --ignore "vendor/composer"
          \ --ignore "web/bundles"
          \ -g ""'
endif
let g:ctrlp_extensions = ['funky', 'nerdtree']
let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
nnoremap <Space><BS> :CtrlPNerdTree<CR> 
nnoremap <Space>/ :CtrlPBufLine<CR>
nnoremap <C-z>  :CtrlPSymfony2Sources<CR>
nnoremap <C-z>s :CtrlP src/<CR>
nnoremap <C-z>m :CtrlPSymfony2Entities<CR>
nnoremap <C-z>c :CtrlPSymfony2Controllers<CR>
nnoremap <C-z>v :CtrlPSymfony2Views<CR>
nnoremap <C-z>a :CtrlPSymfony2Assets<CR>
nnoremap <C-z>o :CtrlPSymfony2Configs<CR>
" }}}

" Easy motion
let g:EasyMotion_leader_key = '<Space>'

" PHP {{{
au FileType php inoremap ,, ->
au FileType php inoremap ,t $this->
au FileType php inoremap ,r return ;<Esc>i
au FileType php inoremap ,< <?php<CR><CR>
au FileType php inoremap ,> <?php  ?><Esc>hhha

au FileType php nnoremap gf :call composer#open_file#open(expand('<cword>'))<CR>

" PHP folding
let php_folding=0

" PHP documentor
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

" PHP Complete
" autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
" let g:phpcomplete_index_composer_command = 'composer'

" PHPUnit
au FileType php nnoremap <Leader>tc :Test 
au FileType php nnoremap <Leader>ta :Test<CR>
au FileType php nnoremap <Leader>tf :Test %<CR>

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

" Advanced highlighting
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
" }}}
" vim: foldmethod=marker
