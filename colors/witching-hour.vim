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
"}}}

" Palettes {{{
let s:none            = ['NONE', 'NONE']

let s:base_bg         = ['#02111d', '0']
let s:base_fg         = ['#cccccc', '188']

let s:base_bg_shade_1 = ['#112630', '17']
let s:base_bg_shade_2 = ['#0d2a41', '17']

let s:hidden          = ['#444444', '59']
let s:comment         = ['#555555', '59']
let s:faint           = ['#777777', '102']

let s:success         = ['#16c347', '41']
let s:warning         = ['#ffa822', '214']
let s:danger          = ['#ff6150', '203']

let s:color_1         = ['#ad7eff', '141']
let s:color_2         = ['#85AF13', '106']
let s:color_3         = ['#19B3C4', '38']
let s:color_4         = ['#c7d100', '184']
let s:color_5         = ['#ff51f6', '207']
let s:color_6         = ['#ffa822', '214']
"}}}

function! s:getHighlight(name, ...)
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

" Generic {{{
call s:getHighlight('Cursor', s:base_bg, s:base_fg)
call s:getHighlight('iCursor', s:base_bg, s:faint)
call s:getHighlight('CursorLine', s:none, s:base_bg_shade_1)
call s:getHighlight('CursorColumn', s:none, s:base_bg_shade_1)
call s:getHighlight('CursorLineNr', s:base_fg, s:base_bg_shade_1)

call s:getHighlight('Normal', s:base_fg, s:base_bg)
call s:getHighlight('LineNr', s:comment, s:base_bg)
call s:getHighlight('ColorColumn', s:none, s:base_bg_shade_2)
call s:getHighlight('Directory', s:color_1)
call s:getHighlight('VertSplit', s:faint)
call s:getHighlight('Folded', s:faint, s:base_bg)
call s:getHighlight('FoldColumn', s:hidden, s:base_bg)
call s:getHighlight('SignColumn', s:none, s:base_bg)
call s:getHighlight('IncSearch', s:base_bg, s:color_1)
call s:getHighlight('NonText', s:hidden)
call s:getHighlight('SpecialKey', s:hidden)
call s:getHighlight('Search', s:base_bg, s:color_6)
call s:getHighlight('StatusLine', s:base_bg, s:base_fg)
call s:getHighlight('StatusLineNC', s:base_fg, s:hidden)
call s:getHighlight('Visual', s:base_bg, s:color_3)
call s:getHighlight('EndOfBuffer', s:hidden, s:base_bg)
call s:getHighlight('Comment', s:comment, s:base_bg, ['italic', 'italic'])

call s:getHighlight('Question', s:base_fg)
call s:getHighlight('ModeMsg', s:base_fg)
call s:getHighlight('ErrorMsg', s:danger, s:base_bg)
call s:getHighlight('WarningMsg', s:warning, s:base_bg)

if has('gui_running')
  call s:getHighlight('SpellBad', s:base_fg, s:base_bg, ['undercurl', 'underline'], s:danger[0])
  call s:getHighlight('SpellCap', s:base_fg, s:base_bg, ['undercurl', 'underline'], s:warning[0])
  call s:getHighlight('SpellLocal', s:base_fg, s:base_bg, ['undercurl', 'underline'], s:warning[0])
  call s:getHighlight('SpellRare', s:base_fg, s:base_bg, ['undercurl', 'underline'], s:warning[0])

else
  call s:getHighlight('SpellBad', s:danger, s:base_bg, ['undercurl', 'underline'], s:danger[0])
  call s:getHighlight('SpellCap', s:warning, s:base_bg, ['undercurl', 'underline'], s:warning[0])
  call s:getHighlight('SpellLocal', s:warning, s:base_bg, ['undercurl', 'underline'], s:warning[0])
  call s:getHighlight('SpellRare', s:warning, s:base_bg, ['undercurl', 'underline'], s:warning[0])
endif


call s:getHighlight('DiffAdd', s:base_bg, s:success)
call s:getHighlight('DiffChange', s:base_bg, s:warning)
call s:getHighlight('DiffDelete', s:base_bg, s:danger)
call s:getHighlight('DiffText', s:base_bg, s:success)
call s:getHighlight('diffAdded', s:success)
call s:getHighlight('diffRemoved', s:danger)

call s:getHighlight('TabLine', s:base_bg, s:base_fg)
call s:getHighlight('TabLineFill', s:none, s:base_fg)
call s:getHighlight('TabLineSel', s:base_fg, s:base_bg)

call s:getHighlight('PMenu', s:none, s:base_bg_shade_2)
call s:getHighlight('PMenuSel', s:base_bg_shade_2, s:base_fg)
call s:getHighlight('PMenuSbar', s:none, s:base_fg)
call s:getHighlight('PMenuThumb', s:none, s:faint)

call s:getHighlight('Constant', s:color_6)
call s:getHighlight('String', s:color_3)
call s:getHighlight('Identifier', s:color_1)
call s:getHighlight('Statement', s:color_1)
call s:getHighlight('Operator', s:color_4)
call s:getHighlight('Exception', s:color_1)
call s:getHighlight('PreProc', s:color_2)
call s:getHighlight('Type', s:color_5)
call s:getHighlight('StorageClass', s:color_5)
call s:getHighlight('Todo', s:base_bg, s:warning)

call s:getHighlight('MatchParen', s:base_bg, s:color_6)
"}}}

" HTML {{{
call s:getHighlight('htmlTag', s:color_1)
highlight link htmlEndTag htmlTag
call s:getHighlight('htmlArg', s:color_2)
call s:getHighlight('htmlString', s:color_3)

call s:getHighlight('htmlH1', s:base_fg, s:none, ['bold', 'bold'])
highlight link htmlH2 htmlH1
highlight link htmlH3 htmlH1
highlight link htmlH4 htmlH1
highlight link htmlH5 htmlH1
highlight link htmlH6 htmlH1
highlight link htmlBold htmlH1

call s:getHighlight('htmlItalic', s:base_fg, s:none, ['italic', 'italic'])
call s:getHighlight('htmlLink', s:base_fg, s:none, ['underline', 'underline'])
"}}}

" javaScript {{{
call s:getHighlight('jsNumber', s:color_4)
call s:getHighlight('jsString', s:color_3)
call s:getHighlight('jsBooleanTrue', s:success)
call s:getHighlight('jsBooleanFalse', s:danger)
highlight link jsNull jsBooleanFalse
highlight link jsUndefined jsBooleanFalse
call s:getHighlight('jsRegexpString', s:color_5)
call s:getHighlight('jsSpecial', s:color_6)

call s:getHighlight('jsComment', s:comment)
call s:getHighlight('jsStorageClass', s:color_1)
call s:getHighlight('jsObjectKey', s:color_2)
call s:getHighlight('jsObjectProp', s:color_2)
call s:getHighlight('jsOperatorKeyword', s:color_6)

call s:getHighlight('jsConditional', s:color_1)
call s:getHighlight('jsVariableDef', s:color_2)
call s:getHighlight('jsFunction', s:color_1)
call s:getHighlight('jsReturn', s:color_6)
call s:getHighlight('jsFuncName', s:color_5)
call s:getHighlight('jsFuncCall', s:color_5)
call s:getHighlight('jsThis', s:color_6)
call s:getHighlight('jsGlobalObjects', s:color_6)
call s:getHighlight('jsStatement', s:color_6)

call s:getHighlight('jsClassKeyword', s:color_1)
call s:getHighlight('jsClassDefinition', s:color_5)
call s:getHighlight('jsClassFuncName', s:color_5)

call s:getHighlight('jsOperator', s:base_fg)
highlight link jsBraces jsOperator
highlight link jsFuncBraces jsOperator
highlight link jsObjectBraces jsOperator
highlight link jsIfElseBraces jsOperator
highlight link jsSwitchBraces jsOperator
highlight link jsTemplateBraces jsOperator
highlight link jsDestructuringBraces jsOperator
highlight link jsRepeatBraces jsOperator
highlight link jsModuleBraces jsOperator
highlight link jsClassBraces jsOperator
highlight link jsParens jsOperator
highlight link jsFuncParens jsOperator
highlight link jsBrackets jsOperator
highlight link jsNoise jsOperator
highlight link jsExtendsKeyword jsOperator
highlight link jsArrowFunction jsOperator

call s:getHighlight('jsImport', s:color_1)
call s:getHighlight('jsFrom', s:color_5)
call s:getHighlight('jsModuleAs', s:color_5)
call s:getHighlight('jsModuleKeyword', s:color_6)
call s:getHighlight('jsModuleAsterisk', s:color_6)
call s:getHighlight('jsExport', s:color_1)
call s:getHighlight('jsExportDefault', s:color_2)
"}}}

" CSS {{{
call s:getHighlight('cssIdentifier', s:color_1)
highlight link cssClassName cssIdentifier
highlight link cssTagName cssIdentifier

call s:getHighlight('cssBraces', s:base_fg)
highlight link cssSelectorOp cssBraces
highlight link cssSelectorOp2 cssBraces
highlight link cssNoise cssBraces
highlight link cssAttrComma cssBraces

call s:getHighlight('cssDefinition', s:color_2)
call s:getHighlight('cssValueNumber', s:color_5)
call s:getHighlight('cssValueLength', s:color_6)
highlight link cssUnitDecorators cssValueLength
call s:getHighlight('cssPseudoClass', s:color_6)
call s:getHighlight('cssAttributeSelector', s:color_6)
call s:getHighlight('cssFunctionName', s:color_5)
call s:getHighlight('cssTextAttr', s:color_3)
highlight link cssCommonAttr cssTextAttr
highlight link cssFlexibleBoxAttr cssTextAttr
highlight link cssUIAttr cssTextAttr
highlight link cssCascadeProp cssTextAttr
highlight link cssBorderAttr cssTextAttr
highlight link cssBoxAttr cssTextAttr
highlight link cssPositioningAttr cssTextAttr
highlight link cssTableAttr cssTextAttr
highlight link cssFontAttr cssTextAttr
"}}}

" SCSS {{{
call s:getHighlight('scssSelectorName', s:color_1)
highlight link scssSelectorChar scssSelectorName
highlight link scssAmpersand scssSelectorName
highlight link scssImport scssSelectorName

call s:getHighlight('scssFunctionName', s:color_6)
call s:getHighlight('scssSemiColon', s:base_fg)
"}}}

" VIM {{{
call s:getHighlight('vimUserFunc', s:color_5)
highlight link vimFunction vimUserFunc
highlight link vimFunc vimUserFunc
highlight link vimFuncName vimUserFunc
highlight link vimFuncSID vimUserFunc

call s:getHighlight('vimOper', s:base_fg)
highlight link vimOperParen vimOper
highlight link vimParenSep vimOper
"}}}
