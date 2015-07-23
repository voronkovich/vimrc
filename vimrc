" Bundles {{{ " Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Common
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'rking/ag.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-surround'
Bundle 'embear/vim-localvimrc'
Bundle 'Yggdroot/indentLine'
Bundle 'xolox/vim-misc'
Bundle 'scrooloose/syntastic'
Bundle 'duggiefresh/vim-easydir'
Bundle 'mhinz/vim-startify'
Bundle 'voronkovich/file-magic.vim'
Bundle 'kana/vim-vspec'

" Tags
Bundle 'ludovicchabant/vim-gutentags'

" CtrlP
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'nixprime/cpsm'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'kassio/ctrlp-bufline.vim'
Bundle 'fisadev/vim-ctrlp-cmdpalette'
Bundle 'ivalkeen/vim-ctrlp-tjump'
Bundle 'voronkovich/ctrlp-nerdtree.vim'

" Colorschemes
Bundle 'xolox/vim-colorscheme-switcher'
Bundle 'flazz/vim-colorschemes'

" Comments
Bundle 'tpope/vim-commentary'

" Code completion
Bundle 'Valloric/YouCompleteMe'

" Snippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'sniphpets/sniphpets'
Bundle 'sniphpets/sniphpets-common'
Bundle 'sniphpets/sniphpets-symfony'
Bundle 'sniphpets/sniphpets-doctrine'
Bundle 'sniphpets/sniphpets-phpunit'
Bundle 'sniphpets/sniphpets-postfix-codes'
Bundle 'voronkovich/ultisnips-t3js'

" PHP
Bundle 'StanAngeloff/php.vim'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'rayburgemeestre/phpfolding.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tobyS/pdv'
Bundle 'tobyS/vmustache'
Bundle 'docteurklein/vim-symfony'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'joonty/vim-phpunitqf.git'
Bundle 'evidens/vim-twig'
Bundle 'adoy/vim-php-refactoring-toolbox'
Bundle 'voronkovich/vim-composer-open-class-file'
Bundle 'voronkovich/vim-phpunit-snippets'
Bundle 'voronkovich/php-getter-setter.vim'
Bundle 'voronkovich/ctrlp-symfony2.vim'

" Html
Bundle 'Valloric/MatchTagAlways'
Bundle 'mattn/emmet-vim'

" ZSH highlighting
Bundle 'clones/vim-zsh'
" }}}

" Common settings {{{1
filetype plugin indent on

let mapleader = ","

nnoremap ; :

" Quit insert mode
inoremap jf <Esc>
inoremap fj <Esc>

nnoremap <C-z> <Nop>

" Launch shell command
nnoremap ! :!

" Colorscheme
set t_Co=256
set background=dark
colo earth
hi Pmenu ctermfg=0 ctermbg=100
hi PmenuSel ctermfg=90 ctermbg=100

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set number
set wildmenu
set wildmode=longest,list,full

" Jump to an end of a string
inoremap ,a <C-o>A
inoremap ;a <C-o>o

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
nmap <Space>l :CtrlPBuffer<CR>
nmap <Leader>q :bd<CR>
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
nnoremap <C-n> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

" Ag
nmap <Leader>a :Ag 

" Saving by Ctrl+a
map <C-a> <Esc>:w<CR> " Add: alias vim="stty stop '' -ixoff ; vim" in your bash aliases
imap <C-a> <Esc>:w<CR>

" CtrlP command palette
nnoremap <Space>; :CtrlPCmdPalette<CR>

" FileMagic {{{
nnoremap <Leader>c :Create 
let g:file_magic_command_alias = 'Create'
let g:file_magic_open_command = 'e'
let g:file_magic_spells = {
    \ 'sfcontro': "src/AppBundle/Controller/%sController.php",
    \ 'sfentity': "src/AppBundle/Entity/%s.php",
    \ 'sfform':   "src/AppBundle/Form/Type/%sType.php",
    \ 'sfview':   "app/Resources/views/%s.twig",
    \ 'sfconf':   "app/config/%s.yml",
    \ 'here':     "!CreateHere"
\ }
" Create file in the same directory as the current buffer
fun! CreateHere(key, file)
    let path = expand('%:p:h')

    if ! empty(path)
        return path . '/' . a:file
    else
        return a:file
    endif
endfun
" }}}

" Guttentags
let g:gutentags_project_root = [ 'vendor/composer' ]

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
let g:cpsm_highlight_mode = 'detailed'
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

" Synastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']
" }}}

" PHP {{{
au FileType php nnoremap gf :call composer#open_file#open(expand('<cword>'))<CR>

" PHP folding
let php_folding=0

" PHP Complete
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" PHPUnit
au FileType php nnoremap <Leader>tc :Test 
au FileType php nnoremap <Leader>ta :Test<CR>
au FileType php nnoremap <Leader>tf :Test %<CR>

" PHPDoc
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
au FileType php nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

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

" PHP namespace
inoremap <Leader>pu <C-O>:call PhpInsertUse()<CR>
noremap <Leader>pu :call PhpInsertUse()<CR>

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
"
" vim: foldmethod=marker
