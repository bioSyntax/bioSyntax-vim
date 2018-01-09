if exists("syntax_on")
	syntax reset
	colorscheme bioSyntax
	set nowrap
endif

set background=dark


" Robust Column Selection in Vim Syntax
" -- This logic can be extended for N columns
" -- To add highlighting to a column add it to the contains list (submatch)
syntax region Col1 matchgroup=Col1 start='^'  end='\n'    contains=Col2
syntax region Col2 matchgroup=Col2 start='\t' end='\n\@=' contains=Col3,hlite2,hlite5,hlite8
syntax region Col3 matchgroup=Col3 start='\t' end='\n\@=' contains=Col4,hlite2,hlite5,hlite8
syntax region Col4 matchgroup=Col4 start='\t' end='\n\@=' contains=Col5
syntax region Col5 matchgroup=Col5 start='\t' end='\n\@=' contains=Col6
syntax region Col6 matchgroup=Col6 start='\t' end='\n\@=' contains=strP,strM

" Submatch Definitions
syntax match strP '+' contained
syntax match strM '-' contained

syntax match hlite8 '[0-9]\([0-9]\{8}\t\)\@=' contained
syntax match hlite5 '[0-9]\([0-9]\{5}\t\)\@=' contained
syntax match hlite2 '[0-9]\([0-9]\{2}\t\)\@=' contained

" Highlighting / Theme Control
" =========================================================

highlight link Col1 chr
highlight link Col2 chrStart
highlight link Col3 chrEnd
highlight link Col4 keyword1
highlight link Col5 numeric
highlight link Col6 strandNone

highlight link strP strandPlus
highlight link strM strandMinus

highlight link hlite2 chrStart2
highlight link hlite5 chrStart2
highlight link hlite8 chrStart2

