syntax match luaMinus       /-\@<!--\@!/
syntax match simpleOperator	"[.!~:*&%<>^|=,+]"
syntax match simpleOperator	"/[^/*=]"me=e-1
syntax match simpleOperator	"/$"
syntax match simpleOperator "&&\|||"
syntax match simpleOperator	"[][]"

syntax match parenDelimiter  "[();\\]"
syntax match luaCustomParen  "(" contains=parenDelimiter
syntax match luaCustomFunc   "\w\+\s*(" contains=luaCustomParen

highlight link potionOperator   Operator
highlight link simpleOperator   Operator
highlight link luaMinus         Operator
highlight link parenDelimiter   Delimiter
highlight link luaFunction      Type
highlight link luaCustomFunc    Function
