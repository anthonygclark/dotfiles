" Anthony Clark
" A mixture of darkspectrum and my
" own creativity. Still need to clean
" it up.
"

hi clear
if exists("syntax_on")
  syntax reset
endif

hi Normal guifg=#eeeeee guibg=#2f2f2f ctermfg=255 ctermbg=235

set background=dark

let g:colors_name = "ac"

hi SpecialKey   gui=NONE            guifg=#0000ff   guibg=NONE            cterm=NONE ctermfg=21 ctermbg=NONE
hi NonText      gui=BOLD            guifg=#0000ff   guibg=NONE            cterm=BOLD ctermfg=21 ctermbg=NONE
hi Directory    gui=NONE            guifg=#0000ff   guibg=NONE            cterm=NONE ctermfg=21 ctermbg=NONE
hi ErrorMsg     gui=NONE            guifg=White     guibg=#ff0000         cterm=NONE ctermfg=231 ctermbg=196
hi IncSearch    gui=reverse         guifg=NONE      guibg=NONE            cterm=reverse ctermfg=NONE ctermbg=NONE
hi Search       gui=NONE            guifg=NONE      guibg=#ffff00         cterm=NONE ctermfg=NONE ctermbg=226
hi MoreMsg      gui=BOLD            guifg=#0087f5   guibg=NONE            cterm=BOLD ctermfg=29 ctermbg=NONE
hi ModeMsg      gui=BOLD            guifg=NONE      guibg=NONE            cterm=BOLD ctermfg=NONE ctermbg=NONE
hi LineNr       gui=NONE            guifg=#af0000   guibg=NONE            cterm=NONE ctermfg=124 ctermbg=NONE
hi Question     gui=BOLD            guifg=#0087f5   guibg=NONE            cterm=BOLD ctermfg=29 ctermbg=NONE
hi StatusLine   gui=BOLD,reverse    guifg=NONE      guibg=NONE            cterm=BOLD,reverse ctermfg=NONE ctermbg=NONE
hi StatusLineNC gui=reverse         guifg=NONE      guibg=NONE            cterm=reverse ctermfg=NONE ctermbg=NONE
hi VertSplit    gui=reverse         guifg=NONE      guibg=NONE            cterm=reverse ctermfg=NONE ctermbg=NONE
hi Title        gui=BOLD            guifg=#ff00ff   guibg=NONE            cterm=BOLD ctermfg=201 ctermbg=NONE
hi WarningMsg   gui=NONE            guifg=#ff0000   guibg=NONE            cterm=NONE ctermfg=196 ctermbg=NONE
hi WildMenu     gui=NONE            guifg=Black     guibg=#ffff00         cterm=NONE ctermfg=16 ctermbg=226
hi Folded       gui=NONE            guifg=#000087   guibg=#d0d0d0         cterm=NONE ctermfg=18 ctermbg=252
hi FoldColumn   gui=NONE            guifg=#000087   guibg=#bcbcbc         cterm=NONE ctermfg=18 ctermbg=250
hi DiffAdd      gui=NONE            guifg=NONE      guibg=#afd7d7         cterm=NONE ctermfg=NONE ctermbg=152
hi DiffChange   gui=NONE            guifg=NONE      guibg=LightMagenta    cterm=NONE ctermfg=NONE ctermbg=LightMagenta
hi DiffDelete   gui=BOLD            guifg=#0000ff   guibg=LightCyan       cterm=BOLD ctermfg=21 ctermbg=195
hi DiffText     gui=BOLD            guifg=NONE      guibg=Red             cterm=BOLD ctermfg=NONE ctermbg=196
hi SignColumn   gui=NONE            guifg=#000087   guibg=Grey            cterm=NONE ctermfg=18 ctermbg=250
hi SpellBad     gui=undercurl       guifg=NONE      guisp=Red             cterm=undercurl ctermfg=NONE ctermbg=196
hi SpellCap     gui=undercurl       guifg=NONE      guisp=Blue            cterm=undercurl ctermfg=NONE ctermbg=21
hi SpellRare    gui=undercurl       guifg=NONE      guisp=Magenta         cterm=undercurl ctermfg=NONE ctermbg=201
hi SpellLocal   gui=undercurl       guifg=NONE      guisp=DarkCyan        cterm=undercurl ctermfg=NONE ctermbg=30
hi Pmenu        gui=NONE            guifg=NONE      guibg=LightMagenta    cterm=NONE ctermfg=NONE ctermbg=LightMagenta
hi PmenuSel     gui=NONE            guifg=NONE      guibg=Grey            cterm=NONE ctermfg=NONE ctermbg=250
hi PmenuSbar    gui=NONE            guifg=NONE      guibg=Grey            cterm=NONE ctermfg=NONE ctermbg=250
hi PmenuThumb   gui=reverse         guifg=NONE      guibg=NONE            cterm=reverse ctermfg=NONE ctermbg=NONE
hi CursorColumn gui=NONE            guifg=NONE      guibg=Grey90          cterm=NONE ctermfg=NONE ctermbg=254
hi CursorLine   gui=NONE            guifg=NONE      guibg=Grey90          cterm=NONE ctermfg=NONE ctermbg=254
hi Cursor       gui=reverse         guifg=NONE      guibg=NONE            cterm=reverse ctermfg=NONE ctermbg=NONE
hi lCursor      gui=reverse         guifg=NONE      guibg=NONE            cterm=reverse ctermfg=NONE ctermbg=NONE
hi MatchParen   gui=NONE            guifg=NONE      guibg=Cyan            cterm=NONE ctermfg=NONE ctermbg=51
hi Cursor       guibg=#ffffff       guifg=#000000   ctermfg=16            ctermbg=231
hi CursorLine   guibg=#000000       ctermbg=16
hi CursorColumn guibg=#444444       ctermbg=238
hi DiffAdd      guifg=#ffd787       guibg=#af8700   gui=NONE              cterm=NONE ctermfg=222 ctermbg=136
hi DiffChange   guifg=#87afff       guibg=#425c78   gui=NONE              cterm=NONE ctermfg=111 ctermbg=60
hi DiffText     guifg=#5fff87       guibg=#00cd00   gui=NONE              cterm=NONE ctermfg=10 ctermbg=2
hi DiffDelete   guifg=#000000       guibg=#000000   gui=NONE              cterm=NONE ctermfg=16 ctermbg=16
hi Number       guifg=#fce94f       ctermfg=11
hi Folded       guibg=#000000       guifg=#FFFFFF   gui=BOLD              cterm=BOLD ctermfg=231 ctermbg=16
hi vimFold      guibg=#000000       guifg=#FFFFFF   gui=BOLD              cterm=BOLD ctermfg=231 ctermbg=16
hi FoldColumn   guibg=#000000       guifg=#FFFFFF   gui=BOLD              cterm=BOLD ctermfg=231 ctermbg=16
hi LineNr       guifg=#7f7f7f       guibg=#202020                         ctermfg=8 ctermbg=234
hi NonText      guifg=#7f7f7f       guibg=#202020                         ctermfg=8 ctermbg=234
hi Folded       guifg=#7f7f7f       guibg=#202020   gui=BOLD              cterm=BOLD ctermfg=8 ctermbg=234
hi FoldeColumn  guifg=#7f7f7f       guibg=#202020   gui=BOLD              cterm=BOLD ctermfg=8 ctermbg=234
hi VertSplit    guibg=#3a3a3a       guifg=#3a3a3a   gui=NONE              cterm=NONE ctermfg=237 ctermbg=237
hi StatusLine   guifg=#FFFFFF       guibg=#3a3a3a   gui=NONE              cterm=NONE ctermfg=231 ctermbg=237
hi StatusLineNC guifg=#808080       guibg=#3a3a3a   gui=NONE              cterm=NONE ctermfg=244 ctermbg=237
hi ModeMsg      guifg=#ffff00       ctermfg=11
hi MoreMsg      guifg=#ffff00       ctermfg=11
hi Visual       guifg=#a8a8a8       guibg=#444444   gui=NONE              cterm=NONE ctermfg=248 ctermbg=238
hi VisualNOS    guifg=#FFFFFF       guibg=#005f87   gui=NONE              cterm=NONE ctermfg=231 ctermbg=24
hi IncSearch    guibg=#FFFFFF       guifg=#ef5939                         ctermfg=203 ctermbg=231
hi Search       guibg=#ff00ff       guifg=#FFFFFF                         ctermfg=231 ctermbg=13
hi SpecialKey   guifg=#5fff87       ctermfg=10
hi Title        guifg=#ff5f5f       ctermfg=203
hi WarningMsg   guifg=#ff5f5f       ctermfg=203
hi Number       guifg=#ffaf5f       ctermfg=215
hi MatchParen   guibg=#ad7fa8       guifg=#FFFFFF                         ctermfg=231 ctermbg=13
hi Comment      guifg=#8a8a8a       ctermfg=240
hi Constant     guifg=#ef5939       gui=NONE                              cterm=NONE ctermfg=203
hi String       guifg=white         ctermfg=white
hi Identifier   guifg=#729fcf       ctermfg=12
hi Statement    guifg=#5fafaf       gui=BOLD                              cterm=BOLD ctermfg=73
hi PreCondit    guifg=#767676       gui=BOLD                              cterm=BOLD ctermfg=243
hi PreProc      guifg=#ffffff       gui=BOLD                              cterm=BOLD ctermfg=231
hi Type         guifg=#5fff87       gui=BOLD                              cterm=BOLD ctermfg=10
hi Special      guifg=#d7af5f       ctermfg=179
hi Underlined   guifg=#ff00ff       gui=underline                         cterm=underline ctermfg=13
hi Directory    guifg=#5c5cff       ctermfg=12
hi Ignore       guifg=#7f7f7f       ctermfg=8
hi Todo         guifg=#FFFFFF       guibg=#ff5f5f   gui=BOLD              cterm=BOLD ctermfg=231 ctermbg=203
hi Function     guifg=#ad7fa8       ctermfg=13

hi WildMenu     guifg=#5fff87       guibg=#444444   gui=NONE              cterm=NONE ctermfg=10 ctermbg=238
hi Pmenu        guibg=#121212       guifg=#5f5fd7                         ctermfg=62 ctermbg=233
hi PmenuSel     guibg=#080808       guifg=#5f87ff   gui=BOLD              cterm=BOLD ctermfg=69 ctermbg=232
hi PmenuThumb   guibg=#121212       guifg=#a8a8a8                         ctermfg=248 ctermbg=233
"hi PmenuSbar    guibg=#444444       guifg=#444444   gui=BOLD              cterm=BOLD ctermfg=247 ctermbg=233

hi cppSTLType   guifg=#5c5cff       gui=BOLD                              cterm=BOLD ctermfg=12
hi spellBad     guisp=#ffaf5f       ctermbg=215
hi spellCap     guisp=#5fd700       ctermbg=76
hi spellRare    guisp=#ff00ff       ctermbg=13
hi spellLocal   guisp=#5c5cff       ctermbg=12
hi link         cppSTL              Function
hi link         Error               Todo
hi link         Character           Number
hi link         rubySymbol          Number
hi link         htmlTag             htmlEndTag
hi link         htmlLink            Underlined
hi link         pythonFunction      Identifier
hi link         Question            Type
hi link         CursorIM            Cursor
hi link         VisualNOS           Visual
hi link         xmlTag              Identifier
hi link         xmlTagName          Identifier
hi link         shDeref             Identifier
hi link         shVariable          Function
hi link         rubySharpBang       Special
hi link         perlSharpBang       Special
hi link         schemeFunc          Statement
hi TabLine      guifg=#9e9e9e       guibg=#1c1c1c   gui=NONE              cterm=NONE ctermfg=247 ctermbg=234
hi TabLineFill  guifg=#7f7f7f       guibg=#1c1c1c   gui=NONE              cterm=NONE ctermfg=8 ctermbg=234
hi TabLineSel   guifg=#FFFFFF       gui=BOLD        cterm=BOLD            ctermfg=231
