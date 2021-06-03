syn keyword goKeyword var package
syn keyword goInterface interface
syn keyword goConstant const
syn keyword goDefinition func
syn keyword Todo TODO containedin=goComment
syn keyword Note NOTE containedin=goComment
syn keyword Fixme FIXME containedin=goComment
syn keyword Bug BUG containedin=goComment
syn keyword Hack HACK containedin=goComment
syn keyword XXX XXX containedin=goComment

syn match goFormat display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlLjzt]\|ll\|hh\)\=\([vTtabcdoqxXUeEfgGspYZ]\|\[\^\=.[^]]*\]\)" containedin=goString,goRawString
syn match goOperator display "[.,:;]"
syn match goFuncDec /^func\>/
syn match goCustomFunc "\w\+\s*(\@=" contains=goCustomParen,goFuncDec
syn match goPackage "\w\(\w\)*\.[^<]"he=e-2,me=e-2 contains=ALLBUT,Float
