"
" Anthony Clark
" vimrc, taken from Sam B.'s 
" vim minimal config and added 
" features as needed. Still a 
" wip/
"


set nocompatible                      " Do not accomodate vi
set t_Co=256                          " Assure 256 color
"set backup                            " Sets backup
"set backupdir=$HOME/.vim/backup       " Backup files location
"set directory=$HOME/.vim/swap         " Swap files location
set tags=./tags,$HOME/.vim/tags       " You probably want to add more to these later.
set hlsearch                          " Highlighted search enabled by default
set incsearch                         " Search options
set smartcase                         " Allows smartcase searching
set modeline                          " Enable per-file formatting and the like
set mouse=nvi                         " Mouse
set foldenable                        " Enable folding
set number                            " Show line numbers 
set spelllang=en                      " Spelling options
set splitbelow splitright             " Put new windows below and right by default
set autoindent smartindent            " Toggle Auto-indent
set tabstop=2 shiftwidth=2 expandtab  " Spaces for tabs, indentation, and avoid real tabs
set nowrap                            " No wrapping of lines
set clipboard+=unnamed                " Yank and copy to X clipboard (maybe)
set laststatus=2                      " Always show the status line
set cmdheight=1                       " Height of command line
set ww=b,s,h,l,<,>,[,]                " Whichwrap -- left/right keys can traverse up/down
set wildmenu                          " Enhanced tab-completion shows all matching cmds in a popup menu
set backspace=indent,eol,start        " Backspace
set stal=2                            " Show tab line

" Status Bar
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\ 

" Enable Sync
if has('syntax')
  syntax on
  " For redrawing the syntax highlighting
  nmap .SS :syn sync fromstart
endif

" Chose colorscheme if in gvim
if has('gui_running') 
  colorscheme ac
else
  colorscheme ac-console
endif

" Misc key bindings
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
nmap .I :set autoindent!<CR>
nmap .T :set expandtab!<CR>

" X11 clipboard access
let mapleader = ","
map <leader>cc :w !xsel -i -b<CR><CR>
map <leader>pp :r!xsel -b<CR><CR>

" Tabbing
nmap .tn :tabnext<CR>
map <C-a> :tabnext<CR>
nmap .tp :tabprevious<CR>
nmap .tt :Te .<CR><CR>

" Folding, highlight text and press space to fold / unfold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

" Write file as ROOT
cmap w!! w !sudo tee % >/dev/null

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
  color ac
  exec 'hardcopy '.a:args
  exec 'color '.colorsave
endfunction
