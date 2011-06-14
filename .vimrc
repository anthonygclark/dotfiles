set backup

" These directories must exist.
set backupdir=$HOME/.vim/backup " backup files location
set directory=$HOME/.vim/swap " swap files location

set tags=./tags,$HOME/.vim/tags " you probably want to add more to these later.

filetype plugin indent on
if has('syntax')
  syntax on
  " For redrawing the syntax highlighting
  nmap .SS :syn sync fromstart
endif

" Spell check
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR>


"Search Options
set hlsearch
nmap .hl :set hlsearch!<CR>
set incsearch
set smartcase

" Enable per-file formatting and the like
set modeline

" Mouse
set mouse=nv

" File buffer navigation
nmap .n :next<CR>
nmap .p :prev<CR>

" Easy buffer selection
nmap .b :ls<CR>:b<Space>

" toggle readonly
nmap .ro :set invreadonly<CR>

" Code folding
set foldenable
nmap <silent> .F :set foldenable!<CR>

" enable line numbering, and a toggle shortcut
set number 
map <silent> .N :set number!<CR>

" Appearance
colorscheme 256-jungle

" Spelling options (and a shortcut to disable it)
set spelllang=en
nmap .sp :set spell!<CR>

" toggle synchronous scrolling of windows
nmap .SB :set scrollbind!<CR>

" toggle non-printing characters
nmap .L :set list!<CR>

" toggles paste mode
nmap .P :set paste!<CR>

" Copy to X CLIPBOARD
let mapleader = ","
map <leader>cc :w !xsel -i -b<CR><CR>
" Paste from X CLIPBOARD
map <leader>pp :r!xsel -b<CR><CR>

" put new windows below and right by default
set splitbelow splitright
 
" no wrapping of lines
set nowrap
nmap .W :set nowrap!<CR>

" toggles auto-changedir in Ex mode?
nmap .C :set invacd<CR>

" toggle auto-indent
set autoindent smartindent
set tabstop=2 shiftwidth=2 expandtab " spaces for tabs, indentation, and avoid real tabs
nmap .I :set autoindent!<CR>
nmap .T :set expandtab!<CR>

" Backspace
set backspace=indent,eol,start

" Tabbing, <C-t> is used for indenting, hence we use something else.
set stal=2
nmap .tn :tabnext<CR>
map <C-a> :tabnext<CR>
nmap .tp :tabprevious<CR>
nmap .tt :Te .<CR><CR>

" Clipboard
set clipboard+=unnamed  " yank and copy to X clipboard

" Allows writing to files with root priviledges
cmap w!! w !sudo tee % >/dev/null
