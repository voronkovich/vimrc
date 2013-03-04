source ~/.vim/vimrc/bundles.vim
filetype plugin indent on

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

" Code autocompletion with eclim
if has("gui_running")
    inoremap <C-Space> <C-x><C-u>
else
    inoremap <Nul> <C-x><C-u>
endif

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

nmap <BS> :NERDTreeToggle<CR>
nmap <Leader>b :BufExplorer<CR>
nmap <Leader>bd :bd<CR>
map <C-S> <ESC>:w<CR> " Add: alias vim="stty stop '' -ixoff ; vim" in your bash aliases
imap <C-S> <ESC>:w<CR>

" File templates
autocmd! BufNewFile * silent! 0r ~/.vim/vimrc/templates/template.%:e

" PHPDoc
au FileType php inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
au FileType php nnoremap <C-P> :call PhpDocSingle()<CR>
au FileType php vnoremap <C-P> :call PhpDocRange()<CR>
au FileType php nnoremap gD :call PhpOpenClassFileUnderCursor()<CR>

colo wombat

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set number

function! PhpGetClassUnderCursor()
    let cursor = getpos(".")
    let cursorPosition = cursor[2]
    let line = getline(".")

    let className = ""
    let begin = cursorPosition
    let end = cursorPosition

    let allowedChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'

    while begin > 0 && stridx(allowedChars, line[begin]) >= 0
        let begin = begin - 1
    endwhile

    let stringLength = strlen(line)
    while end <= stringLength && stridx(allowedChars, line[end]) >= 0
        let end = end + 1
    endwhile

    return strpart(line, begin + 1, end - begin - 1)
endfunction

function! PhpGetFullQualifiedClassName(class)
    if (stridx(a:class, '\') != 0)
        let fullQualifiedClassName = PhpFindMatchingUse(a:class)
        if (fullQualifiedClassName is 0)
            let currentNamespace = PhpFindCurrentNamespace()

            if (currentNamespace is 0)
                let fullQualifiedClassName = a:class
            else
                let fullQualifiedClassName = currentNamespace.'\'.a:class
            endif
        endif
    else
        let fullQualifiedClassName = a:class
    endif

    return fullQualifiedClassName
endfunction

function! PhpOpenClassFileUnderCursor()
    if (exists('g:phpClassFinder') && executable(g:phpClassFinder))
        let phpClass = PhpGetClassUnderCursor()

        let fullQualifiedClassName = PhpGetFullQualifiedClassName(phpClass)

        let file = system(g:phpClassFinder.' '.shellescape(fullQualifiedClassName))

        if file isnot ''
            exec 'edit' file
        endif
    endif
endfunction
