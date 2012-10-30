" Operators
syn match pythonOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match pythonOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match pythonOperator	"[!~*&%<>^|=,+-]"
syn match pythonOperator	"/[^/*=]"me=e-1
syn match pythonOperator	"/$"
syn match pythonOperator "&&\|||"
syn match pythonOperator	"[][]"

" Functions
syn match pythonUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1

" Delimiters
syn match pythonDelimiter    "[();\\]"
syn match pythonBraces display "[{}]"

" Bind True False None as constants
syn keyword pyConstant True False None

" Links
hi def link pythonUserFunction Function
hi def link pythonDelimiter Delimiter
hi def link pythonBraces Delimiter
hi def link pyConstant Constant
