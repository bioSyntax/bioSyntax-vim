" Vim syntax file
" Language:	Nexus file format with some reserved words for MrBayes
" Maintainer:	Luis Carvalho <lexcarvalho@hotmail.com>
" Last Change:	2004 Apr 17

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Public blocks
syn keyword	nexusBlock	begin end
syn keyword	nexusPublic	taxa characters unaligned distances
syn keyword	nexusPublic	sets assumptions codons trees notes
" Main reserved words
syn keyword	nexusBatch	dimensions format matrix translate tree
syn keyword	nexusBatch	taxlabels
" Commands
syn keyword	nexusCommand	charset charstat comparetree ctype
syn keyword	nexusCommand	databreaks delete deroot exclude
syn keyword	nexusCommand	execute include link log
syn keyword	nexusCommand	lset mcmc mcmcp outgroup
syn keyword	nexusCommand	pairs partition plot prset
syn keyword	nexusCommand	props report restore root
syn keyword	nexusCommand	set showmatrix showmodel showtree
syn keyword	nexusCommand	sump sumt taxastat taxset
syn keyword	nexusCommand	unlink usertree
" Parameters
syn keyword	nexusParameter	unordered ordered irreversible
syn keyword	nexusParameter	tratio revmat omega statefreq
syn keyword	nexusParameter	shape pinvar correlation switchrates
syn keyword	nexusParameter	brlens topology speciationrates
syn keyword	nexusParameter	extinctionrates theta
syn keyword	nexusParameter	start stop append replace
syn keyword	nexusParameter	nucmodel nst code rates
syn keyword	nexusParameter	ngammacat nbetacat omegavar covarion
syn keyword	nexusParameter	coding parsmodel
syn keyword	nexusParameter	seed ngen samplefreq swapfreq
syn keyword	nexusParameter	printfreq nchains temp reweight
syn keyword	nexusParameter	burnin startingtree nperts savebrlens
syn keyword	nexusParameter	parameter match
syn keyword	nexusParameter	tratiopr revmatpr aamodelpr omegapr
syn keyword	nexusParameter	ny98omega1pr ny98omega3pr m3omegapr
syn keyword	nexusParameter	codoncatfreqs statefreqpr ratepr shapepr
syn keyword	nexusParameter	ratecorrpr pinvarpr covswitchpr
syn keyword	nexusParameter	symmetricbetapr topologypr brlenspr
syn keyword	nexusParameter	speciationpr extinctionpr sampleprob thetapr
syn keyword	nexusParameter	ratemult autoclose nowarnings
syn keyword	nexusParameter	displaygeq contype showtreeprobs
" Options
syn keyword	nexusOptionsR	4by4 doublet codon
syn keyword	nexusOptionsR	universal vertmt mycoplasma
syn keyword	nexusOptionsR	yeast ciliates metmt
syn keyword	nexusOptionsR	equal gamma propinv invgamma adgamma
syn keyword	nexusOptionsR	noabsencesites nopresencesites
syn keyword	nexusOptionsR	random user perfect consistentwith
syn keyword	nexusOptionsR	scaled ratio dir
syn keyword	nexusOptionsR	halfcompat allcompat
syn keyword	nexusOptionsD	fixed variable beta dirichlet
syn keyword	nexusOptionsD	uniform exponential constraints
syn keyword	nexusOptionsD	unconstrained clock
syn keyword	nexusOptionsD	dna rna protein restriction standard
syn keyword	nexusOptionsD	continuous mixed
syn keyword	nexusOptionsB	ntax nchar datatype interleave
syn keyword	nexusOptionsB	gap missing matchchar
" Categorical
syn keyword	nexusCategorical	yes no all

syn keyword	nexusTodo		contained TODO FIXME XXX

" nexusCommentGroup allows adding matches for special things in comments
syn cluster	nexusCommentGroup	contains=nexusTodo


"catch errors caused by wrong parenthesis and brackets
syn cluster	nexusParenexusGroup	contains=nexusParenexusError,@nexusCommentGroup,nexusCommentStartError,nexusNumber,nexusFloat
syn region	nexusParen		transparent start='(' end=')' contains=ALLBUT,@nexusParenexusGroup,nexusErrInexusBracket
syn match	nexusParenexusError	display "[\])]"
syn match	nexusErrInexusParen	display contained "[\]{}]"
syn region	nexusBracket		transparent start='\[' end='\]' contains=ALLBUT,@nexusParenexusGroup,nexusErrInexusParen
syn match	nexusErrInexusBracket	display contained "[);{}]"

"integer or floating point number
syn case ignore
syn match	nexusNumbersCom		display transparent "\<\d\|\.\d" contains=nexusNumber,nexusFloat
syn match	nexusNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match	nexusNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
"floating point number, with dot, optional exponent
syn match	nexusFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	nexusFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	nexusFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"

"comments
syn region	nexusComment	start="\[" end="\]" contains=@nexusCommentGroup,nexusCommentStartError
syntax match	nexusCommentError	display "\]"
syntax match	nexusCommentStartError	display "\["me=e-1 contained


" Define the default highlighting
if version >= 508 || !exists("did_nexus_syn_inits")
  if version < 508
    let did_nexus_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

	HiLink nexusBlock		Repeat
	HiLink nexusPublic		Structure
	HiLink nexusBatch		Conditional
	HiLink nexusCommand		Statement
	HiLink nexusParameter		Type
	HiLink nexusOptionsR		String
	HiLink nexusOptionsD		Character
	HiLink nexusOptionsB		Include
	HiLink nexusCategorical		Constant

	HiLink nexusNumber		Number
	HiLink nexusNumber		Number
	HiLink nexusFloat		Float
	HiLink nexusParenexusError	nexusError
	HiLink nexusErrInexusParen	nexusError
	HiLink nexusErrInexusBracket	nexusError
	HiLink nexusCommentError	nexusError
	HiLink nexusCommentStartError	nexusError
	HiLink nexusError		Error
	HiLink nexusCommentStart	nexusComment
	HiLink nexusComment		Comment
	HiLink nexusTodo		Todo

	delcommand HiLink
endif

let b:current_syntax = "nexus"

" vim: ts=8
