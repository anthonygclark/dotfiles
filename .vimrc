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
set clipboard=unnamedplus             " Yank and copy to X clipboard (maybe)
set laststatus=2                      " Always show the status line
set cmdheight=1                       " Height of command line
set ww=b,s,h,l,<,>,[,]                " Whichwrap -- left/right keys can traverse up/down
set wildmenu                          " Enhanced tab-completion shows all matching cmds n a popup menu
set backspace=indent,eol,start        " Backspace
set stal=4                            " Show tab line
set formatoptions+=r                  " Adds auto-comment fuctionality (see help :fo)
set listchars+=tab:>-                 " Hidden character prefixes
set listchars+=trail:-                " ^
set listchars+=precedes:<,extends:<   " Show when there is text off screen
set switchbuf=newtab                  " Use open buffer for switching
set printencoding={utf-8}             " For hardcopies
set printheader=-%N-\ %t              " Sets print header to `-Page- title`
set printoptions+=number:y            " Prints numbers
set printfont=Courier:h7              " Sets hardcopy font and size, sadly only Courier font is allowed.
set vop=folds                         " (view options) only save folds
" set omnifunc=syntaxcomplete#Complete  " does anyone know how this actually works?
set backup                            " Sets backup
set backupdir=$HOME/.vim/backup       " Backup files location
set directory=$HOME/.vim/swap         " Swap files location
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
" {{{
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"}}}


" Runtime Stuff
" -----------------------------------------------
"  {{{
runtime ftplugin/man.vim
" }}}


" Plugin Stuff
" -----------------------------------------------
"{{{
" Vim Plug
filetype plugin indent off
call plug#begin('~/.vim/plugged')
" 
" External
Plug 'vim-utils/vim-man'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'milkypostman/vim-togglelist'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/Tabular'

Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

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
map <leader>t} :Tabularize /}<CR>
map <leader>t{ :Tabularize /{<CR>

map <leader>ntt :NERDTreeToggle<CR>

call plug#end()
filetype plugin indent on
"}}}


" File Specific Settings
"-----------------------------------------------
"{{{
autocmd FileType markdown setlocal linebreak wrap
autocmd FileType text setlocal linebreak wrap
autocmd FileType make setlocal noet
autocmd FileType c,h set omnifunc=ccomplete#Complete
autocmd FileType cpp set path+=/usr/include/c++/*
"autocmd FileType python Plugin 'Pydoc.vim'
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" autocmd FileType python set tabstop=4 shiftwidth=4 noet
autocmd FileType python set tabstop=4 shiftwidth=4
autocmd FileType sh set makeprg=shellcheck\ -f\ gcc\ -e\ SC2034\ %
" Use vim's built in man viewer
autocmd FileType c,cpp,h nnoremap K :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>

" Open only quickfix window at the bottom
augroup vimrc_qf
    autocmd!
    "autocmd! FileType qf if !s:is_loclist() | wincmd J | endif
    autocmd! FileType qf wincmd J
augroup END

" Ignore boost headers since they take ages to search through
set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!

"set cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,N0,ps,ts,+s,c3,C0,/0,(0,us,U0,u0,w0,W1s,k0,m0,j0,J0,)20,*70,#0
set cinoptions=:0,g0,t0,(0,u0,j1

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
let g:html_dynamic_folds = 1
"}}}


" Status Bar
"-----------------------------------------------
"{{{
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ %p%%:\ [%l,%L][%c]
"}}}


" Environment
"-----------------------------------------------
"{{{
" syntax sync
if has('syntax')
    " For redrawing the syntax highlighting
    nmap .SS :syn sync fromstart
endif

if has('gui_running')
    set go-=T                " disable toolbar
    set go-=r                " disable right scrollbar
    set go-=L                " disable left scrollbar
    set go+=aA               " use OS clipboard, and more
    set guifont=Monospace\ 9 " some common font
    set lines=48 columns=85  " window size

    " set bg=dark
    " colorscheme hybrid
    " colorscheme molokai
    " colorscheme ac
    colorscheme xcode

    " GVIM doesn't have a proper `sh` mode, so we 
    " just remap to `term`
    cabbrev sh term

else
    set term=$TERM " Give vim your term settings
    set t_Co=256   " Assure 256 color

    " Mouse support
    " As of Thu Feb 11 2016, `urxvt` is the only way
    " to enable mouse control after col 223 even with vsplits
    " in urxvt.
    if &term =~ "rxvt*"
        set ttymouse=urxvt
    else
        if has("mouse_sgr")
            set ttymouse=sgr
        else
            set ttymouse=xterm2
        endif
    endif

    " When in a limited tty
    if &term == "linux"
        colorscheme desert
    else
        " Terminals
        colorscheme ac
    endif

    " Screen title stuff. The goal is to actually
    " set the active window's title
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
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
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

" Write file as root
cmap w!! w !sudo tee % >/dev/null
"}}}


" Functions
"---------------------------------------------------
"{{{


" Check if current window is a location list
function! s:is_loclist(...) abort
    let winnr = a:0 ? a:1 : winnr()
    let l:info = filter(getwininfo(), {_,v -> v.winnr == winnr})[0]
    return l:info.quickfix && l:info.loclist
endfunction

" Not really a function, but tells QuickFix functions to open the cwindow
" after being called automatically.
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

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

"}}}


" vim: foldmethod=marker :
