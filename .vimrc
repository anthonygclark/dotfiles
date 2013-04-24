"------~------~
" Anthony Clark
"------~------~

" General Options
"---------------------------------------------
" {{{
syntax on
filetype plugin indent on

set nocompatible                      " Do not accomodate vi
set hlsearch                          " Highlighted search enabled by default
set noincsearch                       " Turn off incsearch
set smartcase                         " Allows smartcase searching
set modeline                          " Enable per-file formatting and the like
set mouse=a                           " Mouse
set foldenable                        " Enable folding
set cursorline                        " highlight line
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

set printheader=-%N-\ %t              " Sets print header to `-Page- title`
set printoptions+=number:y            " Prints numbers
set printfont=Courier:h7              " Sets hardcopy font and size, sadly only Courier font is allowed.

set vop=folds                         " (view options) only save folds

set backup                            " Sets backup
set backupdir=$HOME/.vim/backup       " Backup files location
set directory=$HOME/.vim/swap         " Swap files location
" }}}


" Extra Tags
" ---------------------------------------------
"  {{{
"for f in split(glob('$HOME/.vim/tags/*'), '\n')
"    exe 'set tags+=' . f
"endfor
" }}}


" Close Scatch/preview buff where not focused
" ----------------------------------------------
"  {{{
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"}}}


" File Specific Settings
"-----------------------------------------------
"{{{
autocmd FileType make setlocal noet 
autocmd FileType python setlocal noet
autocmd FileType c,h set omnifunc=ccomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"}}}


" Abbreviations
"-----------------------------------------------
"{{{
abbreviate #d #define
abbreviate #i #include
abbreviate sysout System.out.println(
abbreviate syserr System.err.println(
"}}}


" Status Bar
"-----------------------------------------------
"{{{
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ %p%%:\ [%l,%L][%c]
"}}}


" Conditionals
"-----------------------------------------------
"{{{
" Fixes Mouse issues in rxvt-unicode
if &term == "rxvt-unicode-256color"
    set ttymouse=urxvt
else
    if &term == "xterm"
        set ttymouse=xterm2
    endif
endif

" Choose color scheme
if &term == "linux"
    colorscheme desert                " for consoles
else
    colorscheme ac                    " for other terminals (ie - urxvt)
endif

" Map Sync
if has('syntax')
    " For redrawing the syntax highlighting
    nmap .SS :syn sync fromstart
endif

" GUI Specific options
if has('gui_running')
    set go-=T                         " disable toolbar
    set go-=r                         " disable right scrollbar
    set guifont=Monospace\ 9
    set lines=48 columns=80
else
    set term=$TERM                    " Give vim your term settings
    set t_Co=256                      " Assure 256 color
endif
"}}}


" Key Bindings
"-------------------------------------------------
"{{{
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR>     
nmap <F8> :TagbarToggle<CR>
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

" X11 clipboard access, There must be a better way...
" ,pp to paste
" ,cc to copy
let mapleader = ","
map <leader>cc :w !xsel -i -b<CR><CR>
map <leader>pp :r!xsel -b<CR><CR>

" Tabbing
nmap .tn :tabnext<CR>
map <C-a> :tabnext<CR>
map .tp :tabprevious<CR>
map <C-z> :tabprevious<CR>
nmap .tt :Te .<CR><CR>

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
"}}}


" vim: foldmethod=marker : 
