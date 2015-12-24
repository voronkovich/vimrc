" Plugins {{{ " Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Common
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'embear/vim-localvimrc'
Plugin 'Yggdroot/indentLine'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/syntastic'
Plugin 'duggiefresh/vim-easydir'
" Plugin 'mhinz/vim-startify'
Plugin 'voronkovich/file-magic.vim'
Plugin 'kana/vim-vspec'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'junegunn/vim-easy-align'

" Tags
Plugin 'ludovicchabant/vim-gutentags'

" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nixprime/cpsm'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'kassio/ctrlp-bufline.vim'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'voronkovich/ctrlp-nerdtree.vim'

" Colorschemes
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'flazz/vim-colorschemes'

" Comments
Plugin 'tpope/vim-commentary'

" Code completion
Plugin 'Valloric/YouCompleteMe'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'sniphpets/sniphpets'
Plugin 'sniphpets/sniphpets-common'
Plugin 'sniphpets/sniphpets-symfony'
Plugin 'sniphpets/sniphpets-doctrine'
Plugin 'sniphpets/sniphpets-phpunit'
Plugin 'sniphpets/sniphpets-postfix-codes'
Plugin 'voronkovich/ultisnips-t3js'

" PHP
Plugin 'StanAngeloff/php.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'rayburgemeestre/phpfolding.vim'
" Plugin 'shawncplus/phpcomplete.vim'
Plugin 'mkusher/padawan.vim'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'docteurklein/vim-symfony'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'dantleech/vim-phpnamespace'
Plugin 'joonty/vim-phpunitqf.git'
Plugin 'evidens/vim-twig'
Plugin 'adoy/vim-php-refactoring-toolbox'
Plugin 'voronkovich/vim-composer-open-class-file'
Plugin 'voronkovich/vim-phpunit-snippets'
Plugin 'voronkovich/php-getter-setter.vim'
Plugin 'voronkovich/ctrlp-symfony2.vim'

" Html
Plugin 'Valloric/MatchTagAlways'
Plugin 'mattn/emmet-vim'

" ZSH highlighting
Plugin 'clones/vim-zsh'

call vundle#end()
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
let g:UltiSnipsSnippetDirectories=[ "UltiSnips", $HOME . '/.vim/vimrc/UltiSnips' ]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}

" Airline
set laststatus=2

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php = [ '->', '::', '(', 'use ', 'namespace ', '\' ]

" NERDTree
nnoremap <BS> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

" Ag
nnoremap <Leader>a :Ag

" Saving by Ctrl+a
nnoremap <C-a> <Esc>:w<CR>
inoremap <C-a> <Esc>:w<CR>

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
    \ 'sflistener': "src/AppBundle/EventListener/%sListener.php",
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
nnoremap <C-z>s :CtrlP src/<CR>
nnoremap <C-z>m :CtrlPSymfonyEntities<CR>
nnoremap <C-z>c :CtrlPSymfonyControllers<CR>
nnoremap <C-z>v :CtrlPSymfonyViews<CR>
nnoremap <C-z>a :CtrlPSymfonyAssets<CR>
nnoremap <C-z>o :CtrlPSymfonyConfigs<CR>
nnoremap <C-z>f :CtrlPSymfonyForms<CR>
nnoremap <C-z>d :CtrlPSymfonyServices<CR>
nnoremap <Leader>f :CtrlPFunky<CR>
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

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
            \ "        $this->%varname% = $%varname%;\n\n" .
            \ "        return $this;\n" .
            \ "    }"

" PHP namespace
inoremap <Leader>pu <C-O>:call PhpInsertUse()<CR>
noremap <Leader>pu :call PhpInsertUse()<CR>
inoremap <Leader>pe <C-O>:call PhpExpandClass()<CR>
noremap <Leader>pe :call PhpExpandClass()<CR>
inoremap <silent><leader>pn :call PhpNamespaceInsert()<CR>
noremap <silent><leader>pn :call PhpNamespaceInsert()<CR>

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
