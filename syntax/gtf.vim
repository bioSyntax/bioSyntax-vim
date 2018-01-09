if exists("syntax_on")
	syntax reset
	colorscheme bioSyntax
	set nowrap
endif

set background=dark

" Robust Column Selection in Vim Syntax
" " -- This logic can be extended for N columns
" " -- To add highlighting to a column add it to the contains list (submatch)
syntax region Col1 matchgroup=Col1 start='^'  end='\n'    contains=Col2
syntax region Col2 matchgroup=Col2 start='\t' end='\n\@=' contains=Col3
syntax region Col3 matchgroup=Col3 start='\t' end='\n\@=' contains=Col4,s,s2,s3,s4,s5,s6,s7,s8,s9
syntax region Col4 matchgroup=Col4 start='\t' end='\n\@=' contains=Col5,hlite2,hlite5,hlite8
syntax region Col5 matchgroup=Col5 start='\t' end='\n\@=' contains=Col6,hlite2,hlite5,hlite8
syntax region Col6 matchgroup=Col6 start='\t' end='\n\@=' contains=Col7
syntax region Col7 matchgroup=Col7 start='\t' end='\n\@=' contains=Col8,plus,minus,nostr
syntax region Col8 matchgroup=Col8 start='\t' end='\n\@=' contains=Col9,frzero,frone,frtwo
syntax region Col9 matchgroup=Col9 start='\t' end='\n\@=' contains=qstring,gid,tid,num,semi,geneName

" " --  Header/Comment section #
syntax region comment matchgroup=comment start='#' end='\n\@='

" " --  Submatch Definitions
" " Column 3: <Feature> specific colours
syntax match s  'exon'        contained
syntax match s2 'transcript'  contained
syntax match s3 'gene'        contained
syntax match s4 'start_codon' contained
syntax match s5 'stop_codon'  contained
syntax match s6 'CDS'         contained
syntax match s7 '5UTR'        contained
syntax match s8 '3UTR'        contained
syntax match s9 'UTR'         contained

" " Column 4,5: contig coordinate color accents
syntax match hlite8 '[0-9]\([0-9]\{8}\t\)\@=' contained
syntax match hlite5 '[0-9]\([0-9]\{5}\t\)\@=' contained
syntax match hlite2 '[0-9]\([0-9]\{2}\t\)\@=' contained

" " Column 7: <strand> specific colours
syntax match plus  '+'   contained
syntax match minus '-'   contained
syntax match nostr '\\.' contained

" " Column 8: <frame>
syntax match frzero '0' contained
syntax match frone  '1' contained
syntax match frtwo  '2' contained

" " Column 9: <Attributes> general
" Generic quoted string
syntax region qstring  matchgroup=qstring  start='\s"\@=' end=';\@=' contains=na,qnum

" Special identifiers
syntax region gid      matchgroup=gid      start='\(\(gene_id\)\s"\)\@=' end=';'       contains=qgen_id
syntax region tid      matchgroup=tid      start='\(\(transcript_id\)\s"\)\@=' end=';' contains=qtran_id
syntax region geneName matchgroup=geneName start='\(\(gene_name\)\s"\)\@=' end=';' contains=gene_name

" Generic
syntax match num '\d' contained " unquoted numeric
syntax match semi ';' contained

" Special quoted strings
syntax match na        '"NA"'                  contained " NA
syntax match qnum      '"[\\+\-0-9.e]*"'       contained " quoted numeric
syntax match qgen_id   '"\<[0-9A-Za-z.-_]*\>"' contained " gene_id
syntax match qtran_id  '"\<[0-9A-Za-z.-_]*\>"' contained " transcript_id
syntax match gene_name '"\<[0-9A-Za-z.-]*\>"'  contained " gene symbol

"
" " Highlighting / Theme Control
" =========================================================
highlight link Col1 chr
highlight link Col2 software
highlight link Col3 normal
highlight link Col4 chrStart
highlight link Col5 chrEnd
highlight link Col6 numeric
highlight link Col7 strandNone
highlight link Col8 comment
highlight link Col9 comment

highlight link hlite2 chrStart2
highlight link hlite5 chrStart2
highlight link hlite8 chrStart2

highlight link plus  strandPlus
highlight link minus strandMinus
highlight link nostr strandNone

highlight link frzero keyword6
highlight link frone  keyword4
highlight link frtwo  string

highlight link gid      comment
highlight link qgen_id  geneLevel
highlight link tid      comment
highlight link qtran_id transcriptLevel
highlight link qstring  quoteString
highlight link na       keyword1

highlight link geneName  comment
highlight link gene_name geneSymbol
highlight link havName   keyword4
highlight link ont_name  keyword6

highlight link num  numeric
highlight link qnum numeric

highlight link s  exonLevel
highlight link s2 transcriptLevel
highlight link s3 geneLevel
highlight link s4 start_codon
highlight link s5 stop_codon
highlight link s6 cds
highlight link s7 utr
highlight link s8 utr
highlight link s9 utr

