" Operators
syn match javaOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match javaOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match javaOperator	"[.!~*&%<>^|=,+-]"
syn match javaOperator	"/[^/*=]"me=e-1
syn match javaOperator	"/$"
syn match javaOperator  "&&\|||"
syn match javaOperator	"[][]"

" Delimiters
syn match javaDelimiter    "[();\\]"
syn match javaBraces display "[{}]"

" Links
hi def link javaDelimiter Delimiter
hi link javaBraces Delimiter
