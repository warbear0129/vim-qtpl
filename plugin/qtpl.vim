if exists("b:qtpl_highlight")
	finish
endif
let g:qtpl_highlight = "1.0.0"

if !exists("b:qtpl_extension")
	let g:qtpl_extension = "*.qtpl"
endif

if g:qtpl_extension == ""
	finish
endif 

exec "au BufNewFile, Bufread " . g:qtpl_extension 

" Match common
syn region string start='"' end='"'

" Match html
syn match htmlAttrs '\w\+='
syn match htmlTags '</\?\w\+>\?'
syn match htmlTags '>'

" Match script
syn region scriptRegion start='<script>' end='</script>'

" Match qtpl
syn keyword qtplKeywords code space elseif endif endfor endfunc comment endcomment plain endplain stripspace endstripspace collapsespace endcollapsespace endswitch import func type struct return
syn match qtplTags '{%\(d\|f\|z\|q\|j\|u\|v\|s\|=\)\?\|%}'

let b:qtpl_highlight = "qtpl"

hi def link string 		Constant

hi def link  htmlTags 		Statement
hi def link htmlAttrs 		Type

hi def link scriptRegion 	PreProc

highlight qtplTags 		ctermfg=LightGreen
highlight qtplKeywords 		ctermfg=Yellow
