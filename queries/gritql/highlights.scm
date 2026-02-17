; Comments
(comment) @comment

; Keywords
"where" @keyword
"and" @keyword.operator
"or" @keyword.operator
"not" @keyword.operator
"!" @keyword.operator
"orelse" @keyword
"any" @keyword
"maybe" @keyword
"contains" @keyword
"includes" @keyword
"within" @keyword
"until" @keyword
"after" @keyword
"before" @keyword
"if" @keyword.conditional
"else" @keyword.conditional
"as" @keyword
"limit" @keyword
"some" @keyword
"every" @keyword
"like" @keyword
"return" @keyword.return
"bubble" @keyword
"sequential" @keyword
"multifile" @keyword
"language" @keyword
"private" @keyword

; Definition names
(patternDefinition
  name: (name) @function)
(predicateDefinition
  name: (name) @function)
(functionDefinition
  name: (name) @function)
(foreignFunctionDefinition
  name: (name) @function)

; Predicate calls
(predicateCall
  name: (name) @function.call)

; Node-like pattern names
(nodeLike
  name: (name) @type)

; Variables
(variable) @variable

; Strings
(stringConstant) @string
(codeSnippet) @string.special
(backtickSnippet) @string.special
(rawBacktickSnippet) @string.special
(doubleQuoteSnippet) @string
(languageSpecificSnippet) @string.special

; Numbers
(intConstant) @number
(signedIntConstant) @number
(doubleConstant) @number.float

; Booleans
(booleanConstant) @boolean

; Special values
(undefined) @constant.builtin
(top) @constant.builtin
(bottom) @constant.builtin

; Regex
(regex) @string.regexp
(snippetRegex) @string.regexp

; Operators
"=>" @operator
"<:" @operator
"+=" @operator
"==" @operator
"!=" @operator
">=" @operator
"<=" @operator
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"%" @operator
"=" @operator
">" @operator
"<" @operator

; Punctuation
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"," @punctuation.delimiter
"." @punctuation.delimiter

; Dotdotdot
(dotdotdot) @punctuation.special

; Annotations
(annotation) @attribute

; Language declarations
(languageName) @string.special.symbol
(foreignLanguageName) @string.special.symbol

; Named arguments
(namedArg
  name: (name) @property)

; Map elements
(mapElement
  key: (name) @property)

; Underscore (wildcard)
(underscore) @variable.builtin
