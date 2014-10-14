"------~------~
" Anthony Clark
"------~------~

" General Options
"---------------------------------------------
" {{{
syntax on

set nocompatible                      " Do not accomodate vi
set title                             " Sets title of term
set hlsearch                          " Highlighted search enabled by default
set noincsearch                       " Turn off incsearch
set smartcase                         " Allows smartcase searching
set modeline                          " Enable per-file formatting and the like
set mouse=a                           " Mouse
set mousemodel=popup_setpos           " Mouse options
set foldenable                        " Enable folding
"set cursorline                        " highlight line
set number                            " Show line numbers 
set spelllang=en                      " Spelling options
set splitbelow splitright             " Put new windows below and right by default
set autoindent smartindent            " Toggle Auto-indent and Smart-indent.
set tabstop=4 shiftwidth=4 expandtab  " Spaces for tabs, indentation, and avoid real tabs
set nowrap                            " No wrapping of lines
set clipboard=unnamed                 " Yank and copy to X clipboard (maybe)
set laststatus=2                      " Always show the status line
set cmdheight=1                       " Height of command line
set ww=b,s,h,l,<,>,[,]                " Whichwrap -- left/right keys can traverse up/down
set wildmenu                          " Enhanced tab-completion shows all matching cmds n a popup menu
set backspace=indent,eol,start        " Backspace
set stal=4                            " Show tab line
set formatoptions+=r                  " Adds auto-comment fuctionality (see help :fo)
set listchars+=tab:>-                 " Hidden character prefixes
set listchars+=trail:-                " ^
set switchbuf=useopen                 " Use open buffer for switching
set listchars+=precedes:<,extends:<   " Show when there is text off screen
set printencoding={utf-8}             " For hardcopies
set printheader=-%N-\ %t              " Sets print header to `-Page- title`
set printoptions+=number:y            " Prints numbers
set printfont=Courier:h7              " Sets hardcopy font and size, sadly only Courier font is allowed.
set vop=folds                         " (view options) only save folds
set omnifunc=syntaxcomplete#Complete  " does anyone know how this actually works?
set backup                            " Sets backup
set backupdir=$HOME/.vim/backup       " Backup files location
set directory=$HOME/.vim/swap         " Swap files location
let g:html_dynamic_folds = 1
"set updatetime=30000 updatecount=100  " Swap options
" }}}


" Tags Stuff
" ---------------------------------------------
"  {{{
" Set this to 1 to parse tags in ~/.vim/tags/
" This is useful for system wide libs, or glibc
let g:find_tags = 0

if g:find_tags == 1
    for f in split(glob('$HOME/.vim/tags/*'), '\n')
        exe 'set tags+=' . f
    endfor
endif
" binary search on tags
set tagbsearch

" }}}


" Close Scatch/preview buff where not focused
" ----------------------------------------------
"  {{{
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"}}}


" Runtime Stuff
" -----------------------------------------------
"  {{{
runtime ftplugin/man.vim
colorscheme ac
" }}}


" Plugin Stuff
" -----------------------------------------------
"  {{{
"  Vundle
filetype plugin indent off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'majutsushi/tagbar'
Plugin 'DoxygenToolkit.vim'
Plugin 'fugitive.vim'
Plugin 'Tabular'

nmap <F8> :TagbarToggle<CR>
nmap <F9> :Dox<CR>

let mapleader = ","

" Fugitive
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gw :Gwrite<CR>
map <leader>gr :Gread<CR>

" Tabularize
map <leader>t=  :Tabularize /=<CR>
map <leader>t:  :Tabularize /:<CR>
map <leader>t,  :Tabularize /,<CR>
map <leader>t\| :Tabularize /\|<CR>
map <leader>t\\ :Tabularize /\\$<CR>
map <leader>t<< :Tabularize /<<<CR>
map <leader>t>> :Tabularize />><CR>


call vundle#end()
filetype plugin indent on
"}}}


" File Specific Settings
"-----------------------------------------------
"{{{
autocmd FileType make setlocal noet 
autocmd FileType c,h set omnifunc=ccomplete#Complete
autocmd FileType cpp set path+=/usr/include/c++/*
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set makeprg=python2\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd FileType python set tabstop=4 shiftwidth=4 noet

"set cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,N0,ps,ts,+s,c3,C0,/0,(0,us,U0,u0,w0,W1s,k0,m0,j0,J0,)20,*70,#0
set cinoptions=:0,g0,t0,(0,u0

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

"}}}


" Abbreviations
"-----------------------------------------------
"{{{
abbreviate #d #define
abbreviate #i #include
abbreviate sysout System.out.println(
abbreviate syserr System.err.println(
"}}}


" Options
" ----------------------------------------------
" {{{
"let g:netrw_liststyle = 3
"let g:netrw_preview   = 1
"let g:netrw_winsize   = 30
"let g:netrw_browse_split = 3
"}}}


" Status Bar
"-----------------------------------------------
"{{{
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ %p%%:\ [%l,%L][%c]
"}}}


" Conditionals
"-----------------------------------------------
"{{{

" Map Sync
if has('syntax')
    " For redrawing the syntax highlighting
    nmap .SS :syn sync fromstart
endif

if has('gui_running')
    set go-=T                   " disable toolbar
    set go-=r                   " disable right scrollbar
    set go-=L                   " disable left scrollbar
    set go+=aA                  " use OS clipboard, and more
    set guifont=Monospace\ 9
    set lines=48 columns=85     " window size

    nnoremap K :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>

else
    set term=$TERM              " Give vim your term settings
    set t_Co=256                " Assure 256 color
    
    " Fixes Mouse issues in rxvt-unicode
    if &term =~ "rxvt*"
        set ttymouse=urxvt
    else
        set ttymouse=xterm2
    endif

    " When in a limited tty
    if &term == "linux"
        colorscheme desert
    endif

    " Screen title stuff
    " TODO set screen's title
    if &term =~ "screen*"
        set t_ts=k
        set t_fs=\
    endif    

endif

"}}}



" Key Bindings
"-------------------------------------------------
"{{{
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR>     
nmap <silent> .N :set number!<CR>
nmap .n :next<CR>
nmap .p :prev<CR>
nmap .b :ls<CR>:b<Space>
nmap .ro :set invreadonly<CR>
nmap .sp :set spell!<CR>
nmap .SB :set scrollbind!<CR>
nmap .hl :set hlsearch!<CR>
nmap .L :set list!<CR>
nmap .P :set paste!<CR>
nmap .W :set nowrap!<CR>
nmap .C :set invacd<CR>
nmap .mm :make! \| copen<CR><CR>

" insert mode binding for correcting the last misspelled word.
imap ^L <Esc>[s1z=`]a

" X11 clipboard access, There must be a better way...
" ,pp to paste
" ,cc to copy
let mapleader = ","
map <leader>cc :w !xsel -i -b<CR><CR>
map <leader>pp :r!xsel -b<CR><CR>

" Tabbing
nmap .tn :tabnext<CR>
map .tp :tabprevious<CR>
nmap .tt :Te .<CR><CR>
nmap .vt :Ve! .<CR><CR>
nmap .st :Se! .<CR><CR>


" Folding, highlight text and press space to fold / unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Write file as ROOT
cmap w!! w !sudo tee % >/dev/null
"}}}


" Functions
"---------------------------------------------------
"{{{
" Highlight the text after 80 column mark
nnoremap <silent> <F5>
            \ :if exists('w:long_line_match') <Bar>
            \   silent! call matchdelete(w:long_line_match) <Bar>
            \   unlet w:long_line_match <Bar>
            \ elseif &textwidth > 0 <Bar>
            \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
            \ else <Bar>
            \   let w:long_line_match = matchadd('ErrorMsg', '\%>81v.\+', -1) <Bar>
            \ endif<CR>

" Printing, allows other colorscheme for printing
command! -nargs=* Hardcopy call DoMyPrint('<args>')
function DoMyPrint(args)
    let colorsave=g:colors_name
    color ac "<---- custom colors here
    exec 'hardcopy '.a:args
    exec 'color '.colorsave
endfunction

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files. Avoid printf() when needing literals or values not stored in
" variables.
function! AppendModeline()
    let l:modeline = " vim: foldmethod=marker : "
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>


" toggles the quickfix window.
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        execute "copen "
    endif
endfunction

" used to track the quickfix window
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

nnoremap <silent> <F7> :QFix<CR>

"}}}



" vim: foldmethod=marker : 
