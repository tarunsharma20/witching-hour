" ===============================================================
" witching-hour
"
" URL: https://github.com/tarunsharma20/witching-hour.git
" Author: Tarun
" License: MIT
" ===============================================================

" Init {{{
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "witching-hour"
" }}}

" Palettes {{{
let s:none            = ['NONE', 'NONE']

let s:base_bg         = ['#02111d', '0']
let s:base_fg         = ['#c0c0c0', '7']

let s:base_bg_shade_1 = ['#112630', '233']
let s:base_bg_shade_2 = ['#0d2a41', '235']

let s:hidden          = ['#444444', '238']
let s:comment         = ['#585858', '240']
let s:faint           = ['#767676', '243']

let s:success         = ['#00af00', '34']
let s:warning         = ['#ffaf00', '214']
let s:danger          = ['#ff5f5f', '203']

let s:color_1         = ['#8787ff', '105']
let s:color_2         = ['#87d75f', '113']
let s:color_3         = ['#00afaf', '37']
let s:color_4         = ['#ffd700', '220']
let s:color_5         = ['#ff00ff', '201']
let s:color_6         = ['#d78700', '172']
" }}}

let s:attrs = {
  \ 'b': 'bold',
  \ 'u': 'underline',
  \ 'uc': 'undercurl',
  \ 'r': 'reverse',
  \ 'R': 'inverse',
  \ 'i': 'italic',
  \ 'so': 'standout',
  \ 'n': 'NONE',
  \ 'bu': 'bold,italic',
  \ 'bui': 'bold,italic,underline',
  \ 'ui': 'underline,italic',
  \}

function! s:HI(name, ...)
  let l:fg = get(a:, 1, s:none)
  let l:bg = get(a:, 2, s:none)
  let l:attrs = get(a:, 3, s:none)
  let l:sp = 'NONE'

  if (exists("a:4"))
   let l:sp = a:4
  endif

  let l:hl_string = [
    \ 'highlight', a:name,
    \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
    \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
    \ 'gui=' . l:attrs[0], 'cterm=' . l:attrs[1],
    \ 'guisp=' . l:sp,
    \]

  execute join(l:hl_string, ' ')
endfunction

" User interface {{{
call s:HI('Normal', s:base_fg, s:base_bg)

call s:HI('Cursor', s:base_bg, s:base_fg)
call s:HI('iCursor', s:base_bg, s:faint)
call s:HI('CursorLine', s:none, s:base_bg_shade_1)
call s:HI('CursorColumn', s:none, s:base_bg_shade_1)
call s:HI('CursorLineNr', s:base_fg, s:base_bg_shade_1)

call s:HI('LineNr', s:comment, s:base_bg)
call s:HI('ColorColumn', s:none, s:base_bg_shade_2)
call s:HI('Directory', s:color_1)
call s:HI('VertSplit', s:faint)
call s:HI('Folded', s:faint, s:base_bg)
call s:HI('FoldColumn', s:hidden, s:base_bg)
call s:HI('SignColumn', s:none, s:base_bg)
call s:HI('IncSearch', s:base_bg, s:color_1)
call s:HI('NonText', s:hidden)
call s:HI('SpecialKey', s:hidden)
call s:HI('Search', s:base_bg, s:color_6)
call s:HI('StatusLine', s:base_bg, s:base_fg)
call s:HI('StatusLineNC', s:base_fg, s:hidden)
call s:HI('Visual', s:base_bg, s:color_3)
call s:HI('EndOfBuffer', s:hidden, s:base_bg)

call s:HI('Question', s:base_fg)
call s:HI('ModeMsg', s:base_fg)
call s:HI('ErrorMsg', s:danger, s:base_bg)
call s:HI('WarningMsg', s:warning, s:base_bg)

if has('gui_running')
  call s:HI('SpellBad', s:none, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:danger[0])
  call s:HI('SpellCap', s:none, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:warning[0])
  call s:HI('SpellLocal', s:none, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:warning[0])
  call s:HI('SpellRare', s:none, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:warning[0])
else
  call s:HI('SpellBad', s:danger, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:danger[0])
  call s:HI('SpellCap', s:warning, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:warning[0])
  call s:HI('SpellLocal', s:warning, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:warning[0])
  call s:HI('SpellRare', s:warning, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:warning[0])
endif

call s:HI('DiffAdd', s:base_bg, s:success)
call s:HI('DiffChange', s:base_bg, s:warning)
call s:HI('DiffDelete', s:base_bg, s:danger)
call s:HI('DiffText', s:base_bg, s:success)
call s:HI('diffAdded', s:success)
call s:HI('diffRemoved', s:danger)

call s:HI('TabLine', s:base_bg, s:base_fg)
call s:HI('TabLineFill', s:none, s:base_fg)
call s:HI('TabLineSel', s:base_fg, s:base_bg)

call s:HI('PMenu', s:none, s:base_bg_shade_2)
call s:HI('PMenuSel', s:base_bg_shade_2, s:base_fg)
call s:HI('PMenuSbar', s:none, s:base_fg)
call s:HI('PMenuThumb', s:none, s:faint)

call s:HI('MatchParen', s:base_bg, s:color_6)
" }}}

" Generic syntax {{{
call s:HI('Comment', s:comment, s:none)

call s:HI('Constant', s:color_6)    " Any constant
call s:HI('String', s:color_3)      " A string constant: 'this is a string'
call s:HI('Character', s:color_2)   " A character constant: 'c', '\n'
call s:HI('Number', s:color_4)      " A number constant: 234, 0xff
call s:HI('Boolean', s:color_6)     " A boolean constant: TRUE, false
call s:HI('Float', s:color_5)       " A floating point constant: 2.3e10

call s:HI('Identifier', s:color_2)  " any variable name
call s:HI('Function', s:color_5)    " function name (also: methods for classes)

call s:HI('Statement', s:color_1)   " any statement
call s:HI('Conditional', s:color_1) " if, then, else, endif, switch, etc.
call s:HI('Repeat', s:color_1)      " for, do, while, etc.
call s:HI('Label', s:color_1)       " case, default, etc.
call s:HI('Operator', s:base_fg)    " 'sizeof', '+', '*', etc.
call s:HI('Keyword', s:color_1)     " Any other keyword
call s:HI('Exception', s:color_1)   " try, catch, throw

call s:HI('PreProc', s:color_5)     " Generic Preprocessor
call s:HI('Include', s:color_5)     " Preprocessor #include
call s:HI('Define', s:color_5)      " Preprocessor #define
call s:HI('Macro', s:color_5)       " Same as Define
call s:HI('PreCondit', s:color_5)   " Preprocessor #if, #else, #endif, etc.

call s:HI('Type', s:color_1)         " int, long, char, etc.
call s:HI('StorageClass', s:color_1) " static, register, volatile, etc.
call s:HI('Structure', s:color_1)    " struct, union, enum, etc.
call s:HI('Typedef', s:color_1)      " A typedef

call s:HI('Special', s:color_6)        " Any special symbol
call s:HI('SpecialChar', s:color_6)    " Special character in a constant
call s:HI('Tag', s:color_1)            " you can use CTRL-] on this
call s:HI('Delimiter', s:color_6)      " character that needs attention
call s:HI('SpecialComment', s:color_6) " Special things inside a comment
call s:HI('Debug', s:color_6)          " Debugging statements

call s:HI('Conceal', s:none, s:none)
call s:HI('WinSeparator', s:faint, s:none)

" Text that stands out, HTML links
call s:HI('Underlined', s:color_6, s:none, [get(s:attrs, 'u'), get(s:attrs, 'u')])

call s:HI('Ignore', s:hidden)

" Any erroneous construct
if has('gui_running')
  call s:HI('Error', s:none, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:danger[0])
else
  call s:HI('Error', s:danger, s:base_bg, [get(s:attrs, 'uc'), get(s:attrs, 'u')], s:danger[0])
endif

" Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
call s:HI('Todo', s:base_bg, s:color_6)
" }}}

" HTML {{{
call s:HI('htmlTag', s:color_1)
highlight link htmlEndTag htmlTag
call s:HI('htmlArg', s:color_2)
call s:HI('htmlString', s:color_3)

call s:HI('htmlTitle', s:color_6, s:none, [get(s:attrs, 'b'), get(s:attrs, 'b')])
call s:HI('htmlH1', s:base_fg, s:none, [get(s:attrs, 'b'), get(s:attrs, 'b')])
highlight link htmlH2 htmlH1
highlight link htmlH3 htmlH1
highlight link htmlH4 htmlH1
highlight link htmlH5 htmlH1
highlight link htmlH6 htmlH1
highlight link htmlBold htmlH1

call s:HI('htmlItalic', s:base_fg, s:none, [get(s:attrs, 'i'), get(s:attrs, 'i')])
call s:HI('htmlLink', s:color_6, s:none, [get(s:attrs, 'u'), get(s:attrs, 'u')])
call s:HI('htmlUnderline', s:base_fg, s:none, [get(s:attrs, 'u'), get(s:attrs, 'u')])
call s:HI('htmlBoldUnderline', s:base_fg, s:none, [get(s:attrs, 'bu'), get(s:attrs, 'bu')])
call s:HI('htmlBoldUnderlineItalic', s:base_fg, s:none, [get(s:attrs, 'bui'), get(s:attrs, 'bui')])
call s:HI('htmlUnderlineItalic', s:base_fg, s:none, [get(s:attrs, 'ui'), get(s:attrs, 'ui')])
" }}}

" JSX {{{
highlight link jsxTagName htmlTag
highlight link jsxComponentName htmlTag
highlight link jsxPunct htmlTag
highlight link jsxAttrib htmlArg

call s:HI('jsxBraces', s:base_fg)
" }}}

" CSS {{{
call s:HI('cssIdentifier', s:color_2)
highlight link cssClassName cssIdentifier

call s:HI('cssBraces', s:base_fg)
highlight link cssClassNameDot cssBraces
highlight link cssAttrComma cssBraces

call s:HI('cssAttributeSelector', s:color_6)
highlight link cssPseudoClassId cssAttributeSelector
highlight link cssPseudoClassFn cssAttributeSelector

call s:HI('cssValueNumber', s:color_3)
highlight link cssValueLength cssValueNumber
highlight link cssPositioningAttr cssValueNumber
highlight link cssCommonAttr cssValueNumber
highlight link cssFlexibleBoxAttr cssValueNumber
highlight link cssBorderAttr cssValueNumber
highlight link cssColor cssValueNumber
highlight link cssBoxAttr cssValueNumber
highlight link cssTableAttr cssValueNumber
highlight link cssUIAttr cssValueNumber
highlight link cssTextAttr cssValueNumber
highlight link cssFontAttr cssValueNumber
highlight link cssMultiColumnAttr cssValueNumber

call s:HI('cssBorderProp', s:color_1)
" }}}

" SCSS {{{
call s:HI('scssVariable', s:color_6)
" }}}

" GitGutter {{{
call s:HI('GitGutterAdd', s:success)
call s:HI('GitGutterDelete', s:danger)
call s:HI('GitGutterChange', s:warning)
call s:HI('GitGutterChangeDelete', s:danger)
" }}}

" Fugitive {{{
call s:HI('diffAdded', s:success)
call s:HI('diffRemoved', s:danger)
" }}}

" javaScript {{{
call s:HI('jsRegexpString', s:color_5)
call s:HI('jsSpecial', s:color_6)
call s:HI('jsOperatorKeyword', s:color_6)

call s:HI('jsObjectKey', s:color_2)
highlight link jsObjectProp jsObjectKey
highlight link jsVariableDef jsObjectKey
highlight link jsDestructuringPropertyValue jsObjectKey
highlight link jsDestructuringBlock jsObjectKey

call s:HI('jsModuleKeyword', s:color_1)
highlight link jsModuleAsterisk jsModuleKeyword
" }}}

" vimwiki {{{
call s:HI('VimwikiHeader1', s:color_1, s:none, [get(s:attrs, 'b'), get(s:attrs, 'b')])
highlight link VimwikiHeader2 VimwikiHeader1
highlight link VimwikiHeader3 VimwikiHeader1
highlight link VimwikiHeader4 VimwikiHeader1
highlight link VimwikiHeader5 VimwikiHeader1
highlight link VimwikiHeader6 VimwikiHeader1

call s:HI('VimwikiListTodo', s:color_3, s:none)
call s:HI('VimwikiCellSeparator', s:color_3, s:none)
call s:HI('VimwikiLink', s:color_2, s:none, [get(s:attrs, 'u'), get(s:attrs, 'u')])
call s:HI('VimwikiCode', s:color_3, s:none)
" }}}

" vim-lsp {{{
call s:HI('LspActionText', s:warning)
call s:HI('LspErrorText', s:danger)
highlight link LspHintText LspActionText
highlight link LspInformationText LspActionText
highlight link LspWarningText LspActionText

call s:HI('LspErrorVirtualText', s:hidden, s:base_bg)
highlight link LspHintVirtualText LspErrorVirtualText
highlight link LspInformationVirtualText LspErrorVirtualText
highlight link LspWarningVirtualText LspErrorVirtualText

call s:HI('lspReference', s:color_1, s:base_bg, [get(s:attrs, 'r'), get(s:attrs, 'r')])
highlight link LspUnknownScope LspErrorVirtualText
" }}}

" barbar.lsp {{{
call s:HI('BufferCurrent', s:base_fg, s:base_bg)
highlight link BufferCurrentIcon BufferCurrent
call s:HI('BufferCurrentIndex', s:color_1, s:base_bg)
highlight link BufferCurrentSign BufferCurrentIndex
call s:HI('BufferCurrentMod', s:warning, s:base_bg)

call s:HI('BufferInactive', s:base_fg, s:comment)
highlight link BufferInactiveIcon BufferInactive
call s:HI('BufferInactiveIndex', s:base_fg, s:comment)
call s:HI('BufferInactiveMod', s:color_4, s:comment)
call s:HI('BufferInactiveSign', s:hidden, s:comment)

call s:HI('BufferVisible', s:base_fg, s:hidden)
highlight link BufferInactiveIcon BufferVisible
call s:HI('BufferVisibleIndex', s:base_fg, s:hidden)
call s:HI('BufferVisibleMod', s:base_fg, s:hidden)
call s:HI('BufferVisibleSign', s:hidden, s:hidden)
" }}}

" nvim-treesitter/nvim-treesitter {{{
call s:HI('TSStrong', s:none, s:none, [get(s:attrs, 'b'), get(s:attrs, 'b')])
call s:HI('TSEmphasis', s:none, s:none, [get(s:attrs, 'i'), get(s:attrs, 'i')])
call s:HI('TSUnderline', s:none, s:none, [get(s:attrs, 'u'), get(s:attrs, 'u')])
call s:HI('TSNote', s:base_bg, s:color_4, [get(s:attrs, 'b'), get(s:attrs, 'b')])
highlight! link TSWarning WarningMsg
highlight! link TSDanger ErrorMsg
highlight! link TSAnnotation TSNote
highlight! link TSAttribute TSNote
highlight! link TSBoolean Boolean
highlight! link TSCharacter Character
highlight! link TSComment Comment
highlight! link TSConditional Conditional
highlight! link TSConstBuiltin Constant
highlight! link TSConstMacro Macro
highlight! link TSConstant Constant
highlight! link TSConstructor Function
highlight! link TSException Exception
highlight! link TSField Constant
highlight! link TSFloat Float
highlight! link TSFuncBuiltin Function
highlight! link TSFuncMacro Macro
highlight! link TSFunction Function
highlight! link TSInclude Keyword
highlight! link TSKeyword Keyword
highlight! link TSKeywordFunction Keyword
highlight! link TSKeywordOperator Keyword
highlight! link TSLabel Label
highlight! link TSMath Operator
highlight! link TSMethod Function
highlight! link TSNamespace Identifier
highlight! link TSNumber Number
highlight! link TSOperator Operator
highlight! link TSParameter Constant
highlight! link TSParameterReference Constant
highlight! link TSProperty Identifier
highlight! link TSPunctBracket Constant
highlight! link TSPunctDelimiter Constant
highlight! link TSPunctSpecial Special
highlight! link TSRepeat Repeat
highlight! link TSStrike Constant
highlight! link TSString String
highlight! link TSStringEscape SpecialChar
highlight! link TSStringRegex jsRegexpString
highlight! link TSStructure Structure
highlight! link TSSymbol Constant
highlight! link TSTag Tag
highlight! link TSTagAttribute htmlArg
highlight! link TSTagDelimiter Constant
highlight! link TSText String
highlight! link TSType Type
highlight! link TSTypeBuiltin Typedef
highlight! link TSURI Constant
highlight! link TSVariable Identifier
highlight! link TSVariableBuiltin Identifier
" }}}

" Terminal {{{
let g:terminal_color_foreground = "#c0c0c0"
let g:terminal_color_background = "#011627"
let g:terminal_color_0 = "#011627"
let g:terminal_color_8 = "#011627"
let g:terminal_color_1 = "#ff5f5f"
let g:terminal_color_9 = "#ff5f5f"
let g:terminal_color_2 = "#00af00"
let g:terminal_color_10 = "#00af00"
let g:terminal_color_3 = "#ffaf00"
let g:terminal_color_11 = "#ffaf00"
let g:terminal_color_4 = "#00afaf"
let g:terminal_color_12 = "#00afaf"
let g:terminal_color_5 = "#ff00ff"
let g:terminal_color_13 = "#ff00ff"
let g:terminal_color_6 = "#8787ff"
let g:terminal_color_14 = "#8787ff"
let g:terminal_color_7 = "#c0c0c0"
let g:terminal_color_15 = "#c0c0c0"
" }}}
