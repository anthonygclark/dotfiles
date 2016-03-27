" ------~------
" Anthony Clark
" ------~-------

hi clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ac"

hi Normal                       guifg=#eeeeee   guibg=#262626                     ctermfg=255   ctermbg=235
hi ErrorMsg     gui=NONE        guifg=White     guibg=#ff0000   cterm=NONE        ctermfg=231   ctermbg=196
hi Question     gui=BOLD        guifg=#00875f   guibg=NONE      cterm=BOLD        ctermfg=29    ctermbg=NONE
hi SignColumn   gui=NONE        guifg=#000087   guibg=Grey      cterm=NONE        ctermfg=18    ctermbg=250
hi SpellBad     gui=undercurl   guifg=NONE      guisp=Red       cterm=undercurl   ctermfg=NONE  ctermbg=196
hi SpellCap     gui=undercurl   guifg=NONE      guisp=Blue      cterm=undercurl   ctermfg=NONE  ctermbg=21
hi SpellRare    gui=undercurl   guifg=NONE      guisp=Magenta   cterm=undercurl   ctermfg=NONE  ctermbg=201
hi SpellLocal   gui=undercurl   guifg=NONE      guisp=DarkCyan  cterm=undercurl   ctermfg=NONE  ctermbg=30
hi lCursor      gui=reverse     guifg=NONE      guibg=NONE      cterm=reverse     ctermfg=NONE  ctermbg=NONE
hi Cursor                       guifg=#000000   guibg=#ffffff                     ctermfg=16    ctermbg=231
hi CursorLine   gui=NONE                        guibg=#262626   cterm=NONE                      ctermbg=235
hi CursorLineNr gui=NONE        guifg=#d7af5f                   cterm=NONE        ctermfg=179
hi CursorColumn gui=NONE                        guibg=#262626   cterm=NONE                      ctermbg=235

hi DiffAdd      guifg=#ffd787   guibg=#af8700   gui=NONE        cterm=NONE        ctermfg=222   ctermbg=136
hi DiffChange   guifg=#87afff   guibg=#425c78   gui=NONE        cterm=NONE        ctermfg=111   ctermbg=60
hi DiffText     guifg=#a4c161   guibg=#519f50   gui=NONE        cterm=NONE        ctermfg=149   ctermbg=2
hi DiffDelete   guifg=#000000   guibg=#000000   gui=NONE        cterm=NONE        ctermfg=16    ctermbg=16

hi vimFold      guibg=#000000   guifg=#FFFFFF   gui=BOLD        cterm=BOLD        ctermfg=231   ctermbg=16
hi FoldColumn   guibg=#000000   guifg=#FFFFFF   gui=BOLD        cterm=BOLD        ctermfg=231   ctermbg=16
hi LineNr       guifg=#7f7f7f   guibg=#202020                                     ctermfg=8     ctermbg=234
hi NonText      guifg=#7f7f7f   guibg=#202020                                     ctermfg=8     ctermbg=234
hi Folded       guifg=#7f7f7f   guibg=#202020   gui=BOLD        cterm=BOLD        ctermfg=8     ctermbg=234
hi FoldeColumn  guifg=#7f7f7f   guibg=#202020   gui=BOLD        cterm=BOLD        ctermfg=8     ctermbg=234
hi VertSplit    guibg=#3a3a3a   guifg=#3a3a3a   gui=NONE        cterm=NONE        ctermfg=237   ctermbg=237
hi StatusLine   guifg=#FFFFFF   guibg=#3a3a3a   gui=NONE        cterm=NONE        ctermfg=231   ctermbg=237
hi StatusLineNC guifg=#808080   guibg=#3a3a3a   gui=NONE        cterm=NONE        ctermfg=244   ctermbg=237
hi ModeMsg      guifg=#d7af5f                                                     ctermfg=179
hi MoreMsg      guifg=#d7af5f                   gui=NONE                          ctermfg=179
hi Visual       guifg=#a8a8a8   guibg=#444444   gui=NONE        cterm=NONE        ctermfg=248   ctermbg=238
hi VisualNOS    guifg=#FFFFFF   guibg=#005f87   gui=NONE        cterm=NONE        ctermfg=231   ctermbg=24
hi IncSearch    guibg=#af5fd7   guifg=#FFFFFF                                     ctermfg=231   ctermbg=134
hi Search       guibg=#af5fd7   guifg=#FFFFFF                                     ctermfg=231   ctermbg=134
hi SpecialKey   guifg=#7f7f7f                                                     ctermfg=8
hi Title        guifg=#ff5f5f                                                     ctermfg=203
hi WarningMsg   guifg=#ff5f5f                                                     ctermfg=203

hi Number       guifg=#ff5f5f                                                     ctermfg=203
hi MatchParen   guibg=#af5fd7   guifg=#FFFFFF                                     ctermfg=231   ctermbg=134
hi Comment      guifg=#585858                                                     ctermfg=240
hi Constant     guifg=#ff5f5f   gui=BOLD                        cterm=BOLD        ctermfg=203
hi String       guifg=#d7af5f                                                     ctermfg=179  
hi Identifier   guifg=#6d9cbe   gui=BOLD                        cterm=BOLD        ctermfg=74
hi Special      guifg=#6d9cbe                                                     ctermfg=74
hi Statement    guifg=#5fafaf   gui=BOLD                        cterm=BOLD        ctermfg=73
hi PreCondit    guifg=#767676   gui=BOLD                        cterm=BOLD        ctermfg=243
hi PreProc      guifg=#ffffff   gui=BOLD                        cterm=BOLD        ctermfg=231
hi Type         guifg=#a4c161   gui=BOLD                        cterm=BOLD        ctermfg=149
hi Underlined   guifg=#af5fd7   gui=underline                   cterm=underline   ctermfg=134
hi Directory    guifg=#6d9cbe                                                     ctermfg=74
hi Ignore       guifg=#7f7f7f                                                     ctermfg=8
hi Todo         guifg=#FFFFFF   guibg=#ff5f5f   gui=BOLD        cterm=BOLD        ctermfg=231   ctermbg=203
hi Function     guifg=#FFFFFF                   gui=BOLD        cterm=BOLD        ctermfg=255
hi Delimiter    guifg=#d7af5f                                                     ctermfg=179

hi WildMenu     guifg=#a4c161   guibg=#444444   gui=NONE        cterm=NONE        ctermfg=149   ctermbg=238

hi Pmenu        guibg=#121212   guifg=#6c6c6c                   ctermfg=242       ctermbg=233
hi PmenuSel     guibg=#080808   guifg=#FFFFFF   gui=BOLD        cterm=BOLD        ctermfg=15    ctermbg=232
hi PmenuThumb   guibg=#121212   guifg=#a8a8a8                   ctermfg=248       ctermbg=233
hi PmenuSbar    guibg=#444444   gui=BOLD                        cterm=BOLD        ctermfg=247   ctermbg=233

hi spellBad     guisp=#ffaf5f                                                                   ctermbg=215
hi spellCap     guisp=#5fd700                                                                   ctermbg=76
hi spellRare    guisp=#ff00ff                                                                   ctermbg=134
hi spellLocal   guisp=#5c5cff                                                                   ctermbg=74

hi link Tag             Identifier
hi link Repeat          Statement 
hi link Conditional     Statement
hi link Operator        Statement
hi link Keyword         Identifier
hi link cppSTL          Function
hi link cppSTLType      Identifier
hi link Error           Todo
hi link Character       Number
hi link rubySymbol      Number
hi link htmlTag         htmlEndTag
hi link htmlLink        Underlined
hi link pythonFunction  Identifier
hi link CursorIM        Cursor
hi link VisualNOS       Visual
hi link xmlTag          Identifier
hi link xmlTagName      Identifier
hi link shDeref         Identifier
hi link shVariable      Function
hi link rubySharpBang   Special
hi link perlSharpBang   Special
hi link schemeFunc      Statement

hi TabLine      guifg=#9e9e9e   guibg=#1c1c1c   gui=NONE        cterm=NONE        ctermfg=247   ctermbg=234
hi TabLineFill  guifg=#7f7f7f   guibg=#1c1c1c   gui=NONE        cterm=NONE        ctermfg=8     ctermbg=234
hi TabLineSel   guifg=#FFFFFF   gui=BOLD                        cterm=BOLD        ctermfg=231
