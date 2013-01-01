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
au FileType php nnoremap gD :call OpenPhpClassFile()<CR>

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

function! GetPhpClass()
    let cursor = getpos(".")
    let cursorPosition = cursor[2]
    let line = getline(".")

    let className = ""
    let begin = cursorPosition
    let end = cursorPosition

    let allowedChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_\'

    while begin > 0 && stridx(allowedChars, line[begin]) >= 0
        let begin = begin - 1
    endwhile

    let stringLength = strlen(line)
    while end <= stringLength && stridx(allowedChars, line[end]) >= 0
        let end = end + 1
    endwhile

    return strpart(line, begin + 1, end - begin - 1)
endfunction

function! OpenPhpClassFile()
    if exists('g:phpClassFinder') && executable(g:phpClassFinder)
        let phpClass = GetPhpClass()

        let fullQualifiedClassName = PhpFindMatchingUse(phpClass)
        if (fullQualifiedClassName is 0)
            let fullQualifiedClassName = phpClass
        endif

        let file = system(g:phpClassFinder.' '.shellescape(fullQualifiedClassName))
        exec "edit" file
    endif
endfunction
