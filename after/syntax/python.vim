syn keyword pythonSelf self
syn keyword pythonDatatype bool int float str bytes tuple list dict set frozenset object
syn keyword pythonConstant True False None
syn keyword pythonClass class
syn keyword pythonDef def async await
syn keyword pythonVar global nonlocal
syn keyword pythonLogicalOperator is in not and or
syn keyword pythonBuiltInDunder __init__, __str__ __repr__
	\ __eq__ __ge__ __gt__ __le__ __ne__ __lt__ __hash__
	\ __add__ __and__ __divmod__ __floordiv__ __lshift__
	\ __matmul__ __mod__ __mul__ __or__ __pow__ __rshift__
	\ __sub__ __truediv__ __xor__ __radd__ __rand__ __rdiv__
	\ __rdivmod__ __rfloordiv__ __rlshift__ __rmatmul__ __rmod__
	\ __rmul__ __ror__ __rpow__ __rrshift__ __rsub__ __rtruediv__
	\ __rxor____iadd__ __iand__ __ifloordiv__ __ilshift__ __imatmul__
	\ __imod__ __imul__ __ior__ __ipow__ __irshift__ __isub__ __itruediv__
	\ __ixor____abs__ __neg__ __pos__ __invert__ __index__ __trunc__
	\ __floor__ __ceil__ __round__ __iter__ __len__ __reversed__
	\ __contains__ __next__ __int__ __bool__ __nonzero__ __complex__
	\ __float__ __format__ __cmp__ __enter__ __exit__ __get__ __set__
	\ __delete__ __set_name__ __aenter__ __aexit__ __aiter__ __anext__
	\ __await__ __call__ __class__ __dir__ __init__ __init_subclass__
	\ __prepare__ __new__ __subclasses__ __instancecheck__ __subclasscheck__
	\ __class_getitem__ __import__ __bytes__ __fspath__ __getnewargs__ __reduce__
	\ __reduce_ex__ __sizeof__ __length_hint__ __getitem__
syn keyword Todo TODO containedin=pythonComment,pythonDocStringD,pythonDocStringS
syn keyword Note NOTE containedin=pythonComment,pythonDocStringD,pythonDocStringS
syn keyword Fixme FIXME containedin=pythonComment,pythonDocStringD,pythonDocStringS
syn keyword Bug BUG containedin=pythonComment,pythonDocStringD,pythonDocStringS
syn keyword Hack HACK containedin=pythonComment,pythonDocStringD,pythonDocStringS
syn keyword XXX XXX containedin=pythonComment,pythonDocStringD,pythonDocStringS

syn match pythonOperator display "[-+=!.,;:%&^*/<>]"
syn match pythonUpperCase display "\v<(_?[A-Z]_?)+>"

syn region pythonDocStringS start=/\([r,u]\)\='''/ end=/'''/
syn region pythonDocStringD start=/\([r,u]\)\="""/ end=/"""/
syn region pythonStringBrackets start=/{/ end=/}/ containedin=pythonString contained

syn match pythonFormat display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlLjzt]\|ll\|hh\)\=\([sd]\|\[\^\=.[^]]*\]\)" containedin=pythonString,pythonRawString
syn match pythonCustomFunc "\w\+\s*(\@=" contains=pythonCustomParen

syn match pythonEscape +{{+ contained containedin=pythonfString,pythonfDocstring
syn match pythonEscape +}}+ contained containedin=pythonfString,pythonfDocstring

syn region pythonfString matchgroup=pythonQuotes
    \ start=+[fF]\@1<=\z(['"]\)+ end="\z1"
    \ contains=@Spell,pythonEscape,pythonInterpolation
syn region pythonfDocstring matchgroup=pythonQuotes
    \ start=+[fF]\@1<=\z('''\|"""\)+ end="\z1" keepend
    \ contains=@Spell,pythonEscape,pythonSpaceError,pythonInterpolation,pythonDoctest

syn region pythonInterpolation contained
    \ matchgroup=pythonFStringBrackets
    \ start=+{{\@!+ end=+}}\@!+ skip=+{{+ keepend
    \ contains=ALLBUT,pythonDecoratorName,pythonDecorator,pythonFunction,pythonDoctestValue,pythonDoctest

syn match pythonStringModifier /:\(.[<^=>]\)\?[-+ ]\?#\?0\?[0-9]*[_,]\?\(\.[0-9]*\)\?[bcdeEfFgGnosxX%]\?/ contained containedin=pythonInterpolation
syn match pythonStringModifier /![sra]/ contained containedin=pythonInterpolation
