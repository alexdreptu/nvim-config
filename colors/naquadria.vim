" Authoe: Alexandru Dreptu <alexdreptu@gmail.com>
" URL: https://github.com/alexdreptu/nvim-config/blob/master/colors/naquadria.vim
" NOTE: Depends on https://github.com/alexdreptu/nvim-config/tree/master/after/syntax/

set bg=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "naquadria"

" Code
let s:normal_color = {"attr": "none", "fg": "#ffffff", "bg": "#2e2d2f"}
let s:comment_color = {"attr": "italic", "fg": "#c0bfc0", "bg": "none"}
let s:comment_doc_color = {"attr": s:comment_color.attr, "fg": "#CBCCB3", "bg": "none"}
let s:string_color = {"attr": "italic", "fg": "#c8d9a6", "bg": "none"}
let s:number_color = {"attr": "none", "fg": "#ffca80", "bg": "none"}
let s:char_color = {"attr": "italic", "fg": "#ffb3ff", "bg": "none"}
let s:const_color = {"attr": "none", "fg": "#4DC3FF", "bg": "none"}
let s:type_color = {"attr": "none", "fg": "#ffb399", "bg": "none"}
let s:cond_color = {"attr": "none", "fg": "#80d4ff", "bg": "none"}
let s:statement_color = {"attr": "none", "fg": s:cond_color.fg, "bg": "none"}
let s:ident_color = {"attr": "none", "fg": "white", "bg": "none"}
let s:func_color = {"attr": "none", "fg": "#b3ccff", "bg": "none"}
let s:keyword_color = {"attr": "none", "fg": "#ccb3ff", "bg": "none"}
let s:include_color = {"attr": "none", "fg": s:keyword_color.fg, "bg": "none"}
let s:loop_color = {"attr": s:cond_color.attr, "fg": s:cond_color.fg, "bg": s:cond_color.bg}
let s:format_color = {"attr": "italic", "fg": "#FFF2B3", "bg": "none"}
let s:module_color = {"attr": "none", "fg": "#B6CC99", "bg": "none"}
let s:def_keyword_color = {"attr": "none", "fg": "#FFDFB3", "bg": "none"}
let s:class_color = {"attr": "none", "fg": s:def_keyword_color.fg, "bg": "none"}
let s:private_color = {"attr": "none", "fg": "#62b38d", "bg": "none"}
let s:special_color = {"attr": "italic", "fg": "#99EEFF", "bg": "none"}
let s:css_class_color = {"attr": "none", "fg": "#9FCC66", "bg": "none"}
let s:operator_color = {"attr": "none", "fg": "#FFF2B3", "bg": "none"}
" let s:paren_color = {"attr": "none", "fg": "#C0F0FF", "bg": "none"}
let s:paren_color = {"attr": "none", "fg": "none", "bg": "none"}
let s:self_color = {"attr": "none", "fg": "#CCB3FF", "bg": "none"}
let s:decorator_color = {"attr": "none", "fg": "#ff9999", "bg": "none"}
let s:builtin_color = {"attr": "none", "fg": "#D1E085", "bg": "none"}
let s:uppercase_color = {"attr": "none", "fg": s:const_color.fg, "bg": "none"}
let s:exceptions_color = {"attr": "none", "fg": s:builtin_color.fg, "bg": "none"}
let s:logical_operator_color = {"attr": "none", "fg": "#FF9EBE", "bg": "none"}
let s:todo_color = {"attr": "none", "fg": "white", "bg": "#a0522d"}
let s:note_color = {"attr": "none", "fg": "white", "bg": "#752d9f"}
let s:hack_color = {"attr": "none", "fg": "white", "bg": s:note_color.bg}
let s:fixme_color = {"attr": "none", "fg": "white", "bg": "#9f2d2d"}
let s:bug_color = {"attr": "none", "fg": "white", "bg": s:fixme_color.bg}
let s:xxx_color = {"attr": "none", "fg": "white", "bg": s:todo_color.bg}

" Editor
let s:popup_window_color = {"attr": "none", "fg": "white", "bg": "#3f3e42"}
let s:popup_window_input_color = {"attr": "none", "fg": "white", "bg": s:popup_window_color.bg}
let s:gutter_red_color = {"attr": "none", "fg": "#ff9999", "bg": s:normal_color.bg}
let s:gutter_blue_color = {"attr": "none", "fg": "#99ddff", "bg": s:normal_color.bg}
let s:gutter_green_color = {"attr": "none", "fg": "#ccff99", "bg": s:normal_color.bg}
let s:gutter_yellow_color = {"attr": "none", "fg": "#ffff99", "bg": s:normal_color.bg}
let s:gutter_orange_color = {"attr": "none", "fg": "#ffcc99", "bg": s:normal_color.bg}
let s:braces_color = {"attr": "none", "fg": "#B3E5FF", "bg": "none"}
let s:tab_line_color = {"attr": "none", "fg": "lightgray", "bg":s:popup_window_color.bg}
let s:tab_line_fill_color = {"attr": "none", "bg": s:tab_line_color.bg}
let s:selection_color = {"attr": "none", "fg": "white", "bg": "#8b70c2"}
let s:match_color = {"attr": "none", "fg": "#ffd2b3", "bg": s:selection_color.bg}
let s:prompt_color = {"attr": "none", "fg": s:gutter_blue_color.fg, "bg": s:popup_window_color.bg}
let s:diff_add_color = {"attr": "none", "fg": s:gutter_green_color.fg, "bg": s:normal_color.bg}
let s:diff_delete_color = {"attr": "none", "fg": s:gutter_red_color.fg, "bg": s:normal_color.bg}
let s:diff_change_color = {"attr": "none", "fg": s:gutter_yellow_color.fg, "bg": s:normal_color.bg}
let s:diff_text_color = {"attr": "none", "fg": s:gutter_orange_color.fg, "bg": s:normal_color.bg}
let s:special_key_color = {"attr": "none", "fg": "#494948", "bg": s:normal_color.bg}
let s:nontext_color = {"attr": "none", "fg": "lightgreen", "bg": "none"}
let s:line_number = {"attr": "none", "fg": '#949494', "bg": s:normal_color.bg}
let s:cursor_line_color = {"attr": "none", "fg": "none", "bg": s:selection_color.bg}
let s:cursor_column_color = {"attr": "none", "fg": "white", "bg": s:tab_line_color.bg}
let s:cursor_line_number_color = {"attr": "none", "fg": "#d1d1d1", "bg": s:normal_color.bg}
let s:sign_column_color = {"attr": "none", "fg": "none", "bg": s:normal_color.bg}
let s:pmenu_color = {"attr": "none", "fg": "white", "bg": s:tab_line_color.bg}
let s:pmenu_selection_color = {"attr": "none", "fg": "white", "bg": "#8b70c2"}
let s:pmenu_selection_bar_color = {"attr": "none", "fg": "none", "bg": s:pmenu_color.bg}
let s:pmenu_thumb_color = {"attr": "none", "fg": "none", "bg": s:pmenu_selection_color.bg}
let s:message_float_red_color = {"attr": "none", "fg": s:gutter_red_color.fg, "bg": s:pmenu_color.bg}
let s:message_float_blue_color = {"attr": "none", "fg": s:gutter_blue_color.fg, "bg": s:pmenu_color.bg}
let s:message_float_green_color = {"attr": "none", "fg": s:gutter_green_color.fg, "bg": s:pmenu_color.bg}
let s:message_float_yellow_color = {"attr": "none", "fg": s:gutter_yellow_color.fg, "bg": s:pmenu_color.bg}
let s:message_float_orange_color = {"attr": "none", "fg": s:gutter_orange_color.fg, "bg": s:pmenu_color.bg}
let s:tab_line_selection_color = {"attr": "none", "fg": "white", "bg": s:pmenu_selection_color.bg}
let s:cursor_color = {"attr": "none", "fg": "black", "bg": "white"}
let s:icursor_color = {"attr": "none", "fg": "none", "bg": s:cursor_color.bg}
let s:search_color = {"attr": "none", "fg": "white", "bg": s:todo_color.bg}
let s:error_msg_color = {"attr": "none", "fg": s:gutter_orange_color.fg, "bg": s:normal_color.bg}
let s:vertical_split_color = {"attr": "none", "fg": "#636363", "bg": s:normal_color.bg}
let s:column_color = {"attr": "none", "fg": "none", "bg": s:tab_line_color.bg}
let s:dir_color = {"attr": "none", "fg": s:gutter_blue_color.fg, "bg": "none"}
let s:match_paren_color = {"attr": "underline", "fg": "#ffb3ff", "bg": "none"}
let s:status_line_color = {"attr": "none", "fg": "#cccccc", "bg": s:tab_line_color.bg}
let s:status_line_nc_color = {"attr": "none", "fg": s:comment_color.fg, "bg": s:status_line_color.bg}
let s:status_line_change_color = {"attr": "none", "fg": s:gutter_green_color.fg,"bg": s:status_line_color.bg}
let s:status_line_normal_color = {"attr": "none", "fg":s:gutter_blue_color.fg, "bg": s:status_line_color.bg}
let s:status_line_insert_color = {"attr": "none", "fg": s:gutter_green_color.fg, "bg": s:status_line_color.bg}
let s:status_line_info_color = {"attr": "none", "fg": "#b3ccff", "bg": s:status_line_color.bg}
let s:status_line_text_color = {"attr": "none", "fg": "white", "bg": s:status_line_color.bg}
let s:status_line_read_only_color = {"attr": "none", "fg": s:gutter_red_color.fg, "bg": s:status_line_color.bg}
let s:folded_color = {"attr": "none", "fg": s:status_line_color.fg, "bg": s:status_line_color.bg}
let s:fold_column_color = {"attr": "none", "fg": s:folded_color.fg, "bg": s:folded_color.bg}
let s:error_color = {"attr": "none", "fg": s:gutter_red_color.fg, "bg": "none"}
let s:indent_guides_color = {"attr": "none", "fg": s:vertical_split_color.fg, "bg": "none"}

" Vim
exe "hi SpecialKey" "gui=".s:special_key_color.attr "guifg=".s:special_key_color.fg "guibg=".s:special_key_color.bg
exe "hi NonText" "gui=".s:nontext_color.attr "guifg=".s:nontext_color.fg
exe "hi LineNr" "gui=".s:line_number.attr "guifg=".s:line_number.fg "guibg=".s:line_number.bg
exe "hi CursorLine" "gui=".s:cursor_line_color.attr "guifg=".s:cursor_line_color.fg "guibg=".s:cursor_line_color.bg
exe "hi CursorColumn" "gui=".s:cursor_column_color.attr "guifg=".s:cursor_column_color.fg "guibg=".s:cursor_column_color.bg
exe "hi CursorLineNr" "gui=".s:cursor_line_number_color.attr "guifg=".s:cursor_line_number_color.fg "guibg=".s:cursor_line_number_color.bg
exe "hi SignColumn" "guibg=".s:sign_column_color["bg"]
exe "hi Pmenu" "gui=".s:pmenu_color.attr "guifg=".s:pmenu_color.fg "guibg=".s:pmenu_color.bg
exe "hi PmenuSel" "gui=".s:pmenu_selection_color.attr "guifg=".s:pmenu_selection_color.fg "guibg=".s:pmenu_selection_color.bg
exe "hi PmenuSbar" "gui=".s:pmenu_selection_bar_color.attr "guibg=".s:pmenu_selection_bar_color.bg
exe "hi PmenuThumb" "gui=".s:pmenu_thumb_color.attr "guibg=".s:pmenu_thumb_color.bg
exe "hi TabLine" "gui=".s:tab_line_color.attr "guifg=".s:tab_line_color.fg "guibg=".s:tab_line_color.bg
exe "hi TabLineFill" "gui=".s:tab_line_fill_color.attr "guibg=".s:tab_line_fill_color.bg
exe "hi TabLineSel" "gui=".s:tab_line_selection_color.attr "guifg=".s:tab_line_selection_color.fg "guibg=".s:tab_line_selection_color.bg
exe "hi Todo" "gui=".s:todo_color.attr "guifg=".s:todo_color.fg "guibg=".s:todo_color.bg
exe "hi Note" "gui=".s:note_color.attr "guifg=".s:note_color.fg "guibg=".s:note_color.bg
exe "hi Fixme" "gui=".s:fixme_color.attr "guifg=".s:fixme_color.fg "guibg=".s:fixme_color.bg
exe "hi Bug" "gui=".s:bug_color.attr "guifg=".s:bug_color.fg "guibg=".s:bug_color.bg
exe "hi Hack" "gui=".s:hack_color.attr "guifg=".s:hack_color.fg "guibg=".s:hack_color.bg
exe "hi XXX" "gui=".s:xxx_color.attr "guifg=".s:xxx_color.fg "guibg=".s:xxx_color.bg
exe "hi Search" "gui=".s:search_color.attr "guifg=".s:search_color.fg "guibg=".s:search_color.bg
exe "hi Visual" "gui=".s:selection_color.attr "guifg=".s:selection_color.fg "guibg=".s:selection_color.bg
exe "hi ErrorMsg" "gui=".s:error_msg_color.attr "guifg=".s:error_msg_color.fg "guibg=".s:error_msg_color.bg
exe "hi VertSplit" "gui=".s:vertical_split_color.attr "guifg=".s:vertical_split_color.fg "guibg=".s:vertical_split_color.bg
exe "hi ColorColumn" "gui=".s:column_color.attr "guibg=".s:column_color.bg
exe "hi Cursor" "gui=".s:cursor_color.attr "guifg=".s:cursor_color.fg "guibg=".s:cursor_color.bg
exe "hi iCursor" "gui=".s:icursor_color.attr "guibg=".s:icursor_color.bg
exe "hi Directory" "gui=".s:dir_color.attr "guifg=".s:dir_color.fg
exe "hi MatchParen" "gui=".s:match_paren_color.attr "guifg=".s:match_paren_color.fg "guibg=".s:match_paren_color.bg
exe "hi StatusLine" "gui=".s:status_line_color.attr "guifg=".s:status_line_color.fg "guibg=".s:status_line_color.bg
exe "hi StatusLineNC" "gui=".s:status_line_nc_color.attr "guifg=".s:status_line_nc_color.fg "guibg=".s:status_line_nc_color.bg
exe "hi StatusLineChange" "gui=".s:status_line_change_color.attr "guifg=".s:status_line_change_color.fg "guibg=".s:status_line_change_color.bg
exe "hi StatusLineNormal" "gui=".s:status_line_normal_color.attr "guifg=".s:status_line_normal_color.fg "guibg=".s:status_line_normal_color.bg
exe "hi StatusLineInsert" "gui=".s:status_line_insert_color.attr "guifg=".s:status_line_insert_color.fg "guibg=".s:status_line_insert_color.bg
exe "hi StatusLineInfo" "gui=".s:status_line_info_color.attr "guifg=".s:status_line_info_color.fg "guibg=".s:status_line_info_color.bg
exe "hi StatusLineReadOnly" "gui=".s:status_line_read_only_color.attr "guifg=".s:status_line_read_only_color.fg "guibg=".s:status_line_read_only_color.bg
exe "hi StatusLineBraces" "gui=".s:braces_color.attr "guifg=".s:braces_color.fg "guibg=".s:status_line_color.bg
exe "hi StatusLineText" "gui=".s:status_line_text_color.attr "guifg=".s:status_line_text_color.fg "guibg=".s:status_line_text_color.bg
exe "hi StatusLineError" "gui=".s:status_line_color.attr "guifg=".s:gutter_red_color.fg "guibg=".s:status_line_color.bg
exe "hi StatusLineWarning" "gui=".s:status_line_color.attr "guifg=".s:gutter_orange_color.fg "guibg=".s:status_line_color.bg
exe "hi Folded" "gui=".s:folded_color.attr "guifg=".s:folded_color.fg "guibg=".s:folded_color.bg
exe "hi FoldColumn" "gui=".s:fold_column_color.attr "guifg=".s:fold_column_color.fg "guibg=".s:fold_column_color.bg
exe "hi IndentGuides" "gui=".s:indent_guides_color.attr "guifg=".s:indent_guides_color.fg "guibg=".s:indent_guides_color.bg

" General
exe "hi Normal" "gui=".s:normal_color.attr "guifg=".s:normal_color.fg "guibg=".s:normal_color.bg
exe "hi Comment" "gui=".s:comment_color.attr "guifg=".s:comment_color.fg
exe "hi CommentDoc" "gui=".s:comment_doc_color.attr "guifg=".s:comment_doc_color.fg
exe "hi String" "gui=".s:string_color.attr "guifg=".s:string_color.fg "guibg=".s:string_color.bg
exe "hi Quote" "gui=".s:string_color.attr "guifg=".s:string_color.fg "guibg=".s:string_color.bg
exe "hi Format" "gui=".s:format_color.attr "guifg=".s:format_color.fg
exe "hi Number" "gui=".s:number_color.attr "guifg=".s:number_color.fg
exe "hi Character" "gui=".s:char_color.attr "guifg=".s:char_color.fg
exe "hi Constant" "gui=".s:const_color.attr "guifg=".s:const_color.fg
exe "hi UpperCase" "gui=".s:uppercase_color.attr "guifg=".s:uppercase_color.fg
exe "hi Type" "gui=".s:type_color.attr "guifg=".s:type_color.fg
exe "hi Statement" "gui=".s:statement_color.attr "guifg=".s:statement_color.fg
exe "hi Conditional" "gui=".s:cond_color.attr "guifg=".s:cond_color.fg
exe "hi Repeat" "gui=".s:loop_color.attr "guifg=".s:loop_color.fg
exe "hi Identifier" "gui=".s:ident_color.attr "guifg=".s:ident_color.fg
exe "hi Function" "gui=".s:func_color.attr "guifg=".s:func_color.fg
exe "hi PreProc" "gui=".s:include_color.attr "guifg=".s:include_color.fg
exe "hi Keyword" "gui=".s:keyword_color.attr "guifg=".s:keyword_color.fg
exe "hi Error" "gui=".s:error_color.attr "guifg=".s:error_color.fg "guibg=".s:error_color.bg
exe "hi GutterRed" "gui=".s:gutter_red_color.attr "guifg=".s:gutter_red_color.fg "guibg=".s:gutter_red_color.bg
exe "hi GutterBlue" "gui=".s:gutter_blue_color.attr "guifg=".s:gutter_blue_color.fg "guibg=".s:gutter_blue_color.bg
exe "hi GutterGreen" "gui=".s:gutter_green_color.attr "guifg=".s:gutter_green_color.fg "guibg=".s:gutter_green_color.bg
exe "hi GutterYellow" "gui=".s:gutter_yellow_color.attr "guifg=".s:gutter_yellow_color.fg "guibg=".s:gutter_yellow_color.bg
exe "hi GutterOrange" "gui=".s:gutter_orange_color.attr "guifg=".s:gutter_orange_color.fg "guibg=".s:gutter_orange_color.bg
exe "hi MessageFloatRed" "gui=".s:message_float_red_color.attr "guifg=".s:message_float_red_color.fg "guibg=".s:message_float_red_color.bg
exe "hi MessageFloatBlue" "gui=".s:message_float_blue_color.attr "guifg=".s:message_float_blue_color.fg "guibg=".s:message_float_blue_color.bg
exe "hi MessageFloatGreen" "gui=".s:message_float_green_color.attr "guifg=".s:message_float_green_color.fg "guibg=".s:message_float_green_color.bg
exe "hi MessageFloatYellow" "gui=".s:message_float_yellow_color.attr "guifg=".s:message_float_yellow_color.fg "guibg=".s:message_float_yellow_color.bg
exe "hi MessageFloatOrange" "gui=".s:message_float_orange_color.attr "guifg=".s:message_float_orange_color.fg "guibg=".s:message_float_orange_color.bg
exe "hi DiffAdd" "gui=".s:diff_add_color.attr "guifg=".s:diff_add_color.fg "guibg=".s:diff_add_color.bg
exe "hi DiffDelete" "gui=".s:diff_delete_color.attr "guifg=".s:diff_delete_color.fg "guibg=".s:diff_delete_color.bg
exe "hi DiffChange" "gui=".s:diff_change_color.attr "guifg=".s:diff_change_color.fg "guibg=".s:diff_change_color.bg
exe "hi DIffText" "gui=".s:diff_text_color.attr "guibg=".s:diff_text_color.fg "guibg=".s:diff_text_color.bg
exe "hi Module" "gui=".s:module_color.attr "guifg=".s:module_color.fg
exe "hi DefKeyword" "gui=".s:def_keyword_color.attr "guifg=".s:def_keyword_color.fg "guibg=".s:def_keyword_color.bg
exe "hi Class" "gui=".s:class_color.attr "guifg=".s:class_color.fg
exe "hi Private" "gui=".s:private_color.attr "guifg=".s:private_color.fg
exe "hi Special" "gui=".s:special_color.attr "guifg=".s:special_color.fg
"exe "hi Object" "gui=".s:object_color.attr "guifg=".s:object_color.fg
exe "hi Operator" "gui=".s:operator_color.attr "guifg=".s:operator_color.fg
exe "hi Paren" "gui=".s:paren_color.attr "guifg=".s:paren_color.fg
exe "hi Title" "gui=".s:keyword_color.attr "guifg=".s:keyword_color.fg
exe "hi Self" "gui=".s:self_color.attr "guifg=".s:self_color.fg
exe "hi Decorator" "gui=".s:decorator_color.attr "guifg=".s:decorator_color.fg
exe "hi BuiltIn" "gui=".s:builtin_color.attr "guifg=".s:builtin_color.fg
exe "hi Exceptions" "gui=".s:exceptions_color.attr "guifg=".s:exceptions_color.fg
exe "hi LogicalOperator" "gui=".s:logical_operator_color.attr "guifg=".s:logical_operator_color.fg

hi link StatusLineMode StatusLineNormal
hi link vimHighlight Statement
hi link vimCommand Statement
hi link vimLet Statement
hi link vimNotFunc Conditional
hi link vimOption Conditional
hi link vimSynMtchOpt Keyword
hi link vimSynContains Keyword
hi link vimGroupAdd Keyword
hi link vimGroupSpecial Module
hi link vimPatSep none
hi link vimPatSepR none
hi link vimMapModKey none
hi link vimNotation none
hi link vimOper none
hi link vimHiGui none
hi link vimHiGuiFgBg none
hi link vimHiCtermFgBg none

" Vim
hi link VimAugroup Keyword
hi link VimAutocmd Keyword
hi link VimAugroupKey Keyword
hi link VimMap Keyword
hi link VimCommentTitle Keyword
hi link VimEnvvar Constant
hi link VimLet Keyword
hi link VimOption Type
hi link VimSetSep Operator
hi link VimOper Operator
hi link VimOperParen none
hi link vimSep none
hi link vimParenSep none

hi NonText          guifg=bg
hi link Float Number
hi link Macro PreProc
hi link Label Conditional
hi link Operator Keyword
hi link Delimiter none

" C
hi link cInclude PreProc
hi link cIncluded Module
hi link cPreCondit cInclude
hi link cFormat Format
hi link cStorageClass Class
hi link cSpecial Special
hi link cStructure Class
hi link cOperator Constant
hi link cUserLabel Statement
" customs - defined in $HOME/.vim/after/syntax/c.vim
hi link cOperator Operator
hi link cStatement Statement
hi link cStatement2 Type

"hi link cParenError     none

" C++
hi link cppStructure Class
" customs - defined in $HOME/.vim/after/syntax/cpp.vim
hi link cppKeyword1 Private
hi link cppKeyword2 Conditional
"hi link cppKeyword3 Class

" Rust
hi link rustStorage DefKeyword
hi link rustSelf Private
hi link rustModPathSep Operator
hi link rustSigil Operator
hi link rustCommentlineDoc CommentDoc
hi link rustModPath none

" Java
hi link javaFormat Format
hi link javaExternal Conditional
hi link javaSpecialChar Special
hi link javaClassDecl DefKeyword
hi link javaScopeDecl javaClassDecl
hi link javaStorageClass javaClassDecl
hi link javaUserLabel Statement
hi link javaDocComment CommentDoc
hi link javaCommentTitle javaDocComment
hi link javaDocTags javaDocComment
hi link javaDocParam javaDocComment
" customs - defined in $HOME/.vim/after/syntax/java.vim
hi link javaFunc Function
hi link javaVisibility Private
hi link javaActionDecl javaVisibility
hi link javaThis javaVisibility

" Bash
hi link shFunction Function
hi link shDerefSimple Format
hi link shCommandSub Keyword
hi link shLoop Conditional
hi link shQuote String
hi link shSnglCase Operator
hi link shCaseBar shSnglCase
hi link shTestOpr Operator
hi link shRange none
hi link shCmdSubRegion none
hi link shArithRegion none
hi link shVariable none
hi link shCaseEsac none

" Go
hi link goDirective goConditional
hi link goDeclaration Keyword
hi link goDeclType Type
hi link goConditional Conditional
hi link goString String
hi link goCharacter String
hi link goConstants Constant
hi link goEscapeC Special
hi link goEscapeOctal Special
hi link goSpaceError SpecialKey
hi link goEscapeError Visual
hi link goEscapeX Special
hi link goKeyword Keyword
hi link goInterface Type
hi link goFuncDec Keyword
hi link goFormat Format
hi link goPackage none
hi link goBuiltins BuiltIn
hi link goConstant Constant
hi link goOperator Operator
hi link goParen none
hi link goBlock none
hi link goDefinition DefKeyword
hi link goCustomFunc Function

" Python
hi link pythonCustomFunc Function
hi link pythonInclude Keyword
hi link pythonBuiltIn BuiltIn
hi link pythonBuiltInDunder pythonBuiltIn
hi link pythonSpaceError SpecialKey
hi link pythonEscape Special
hi link pythonException Statement
hi link pythonExceptions Exceptions
hi link pythonUpperCase UpperCase
hi link pythonLogicalOperator LogicalOperator
hi link pythonDocStringS CommentDoc
hi link pythonDocStringD CommentDoc
hi link pythonFormat Format
hi link pythonBrackets pythonFormat
hi link pythonSelf Self
hi link pythonDatatype Type
hi link pythonClass DefKeyword
hi link pythonDef DefKeyword
hi link pythonDecoratorName Decorator
hi link pythonDecorator Operator
hi link pythonConstant Constant
hi link pythonVar Statement
hi link pythonfString String
hi link pythonfDocstring String
hi link pythonStringModifier PreProc
hi link pythonStringBrackets Format
hi link pythonFStringBrackets Format
hi link pythonInterpolation Type

" Ruby
hi link rubyStringDelimiter String
hi link rubyClass DefKeyword
hi link rubyInterpolationDelimiter Format
hi link rubyDefine Keyword
hi link rubyInclude Conditional
hi link rubySharpBang Comment

" JavaScript
hi link jsFuncCall Function
hi link jsFunction DefKeyword
hi link jsClassKeyword DefKeyword
hi link jsFuncParens Paren
hi link jsFuncBraces Paren
hi link jsParens Paren
hi link jsBrackets Paren
hi link jsObjectBraces paren
hi link jsIfElseBraces Paren
hi link jsArrowFunction Operator
hi link jsStorageClass Keyword
hi link jsGlobalObjects Module
hi link jsClassKeywords DefKeyword
hi link jsModuleKeywords Conditional
hi link jsModuleOperators jsModuleKeywords
hi link jsOperator Operator
hi link jsNoise Operator
hi link jsTernaryIfOperator Operator
hi link jsGenerator Operator
hi link jsTemplateVar Format
hi link jsSuper Keyword
hi link jsThis Keyword
hi link jsStatic DefKeyword
hi link jsPrototype Keyword
hi link jsHtmlEvents Keyword
hi link jsNan Constant
hi link jsBuiltins Module
hi link jsModules Conditional
hi link jsModuleWords jsModules
hi link jsParensError none
hi link jsFuncArgRest none
"hi link jsCustomFunc Function
hi link jsFormat Format
hi link jsKeyword Keyword
hi link jsShebang Comment
hi link jsGlobalObjects BuiltIn
hi link jsGlobalNodeObjects BuiltIn

" JSX
hi link jsxBraces Paren
hi link jsxClosePunct Paren

" TypeScript
" yats
hi link typescriptAccessibilityModifier Private
" typescript-vim
hi link typescriptOperator Operator
hi link typescriptAssign Operator
hi link typescriptBraces none
hi link typescriptParens none
hi link typescriptFuncKeyword Keyword
hi link typescriptIdentifier jsStorageClass
hi link typescriptEndColons Operator
hi link typescriptOpSymbols typescriptEndColons
hi link typescriptDecorators cssClassName
hi link typescriptGlobalObjects jsGlobalObjects
"hi link typescriptReserved Class
hi link typescriptHtmlElemProperties none

" JSON
hi link jsonKeyword Keyword
hi link jsonBraces none
hi link jsonQuote String

" HTML
hi link htmlTagName Type
hi link htmlSpecialTagName Type
hi link htmlArg Keyword
hi link htmlH1 String
hi link htmlSpecialChar Statement
hi link htmlCommentError SpecialKey
hi link htmlTitle none
hi link htmlHead none
hi link htmlScriptTag none
hi link htmlTag none
hi link htmlBold none
hi link htmlLink none
"hi link HTMLjsOps jsOps
"hi link HTMLjsCustomFunc jsCustomFunc

" XML
hi link xmlTagName htmlTagName
hi link xmlEndTag xmlTagName

" CSS
exe "hi cssClassName" "gui=".s:css_class_color.attr "guifg=".s:css_class_color.fg "guibg=".s:css_class_color.bg
hi link cssTagName htmlTagName
hi link cssKeyFrameSelector Repeat
hi link cssFontAttr Number
hi link cssFunctionComma cssAttrComma
hi link cssIdentifier Statement
hi link cssIncludeKeyword Module
hi link cssColor Number
hi link cssUnitDecorators cssColor
hi link cssValueLength Number
hi link cssClassNameDot Operator
hi link cssNoise Operator
hi link cssTextProp none
hi link cssFontProp none
hi link cssBackgroundProp none
hi link cssBraces none
hi link cssAttrComma none
hi link cssColorProp none
hi link cssBoxProp none
hi link cssDimensionProp none
hi link cssTableProp none
hi link cssPositioningProp none
hi link cssUIProp none

" YAML
hi link yamlKeyValueDelimiter Operator
hi link yamlBlockCollectionItemStart Operator
hi link yamlBlockMappingKey Keyword
hi link yamlFlowIndicator Paren

" Markdown
hi link markdownH1 Function
hi link markdownH2 Function
hi link markdownH3 Function
hi link markdownH4 Function
hi link markdownH5 Function
hi link markdownH6 Function

" SQL
hi link sqlKeyword Keyword
hi link sqlStatement Keyword
hi link sqlSpecial Constant

" ALE
hi link ALEErrorSign GutterRed
hi link ALEError GutterRed
hi link ALEWarningSign GutterYellow
hi link ALEWarning GutterYellow

" NERDTree
exe "hi NERDTreeExecFile" "gui=".s:gutter_green_color.attr "guifg=".s:gutter_green_color.fg "guibg=none"
exe "hi NERDTreeRO" "gui=".s:gutter_red_color.attr "guifg=".s:gutter_red_color.fg "guibg=none"
exe "hi NERDTreeOpenable" "gui=".s:gutter_yellow_color.attr "guifg=".s:gutter_yellow_color.fg "guibg=none"
exe "hi NERDTreeClosable" "gui=".s:gutter_yellow_color.attr "guifg=".s:gutter_yellow_color.fg "guibg=none"

" Leaderf
exe "hi Lf_hl_popup_inputText" "gui=".s:popup_window_input_color.attr "guifg=".s:popup_window_input_color.fg "guibg=".s:popup_window_input_color.bg
exe "hi Lf_hl_popup_window" "gui=".s:popup_window_color.attr "guifg=".s:popup_window_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_popup_blank" "gui=".s:popup_window_color.attr "guifg=".s:popup_window_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_popup_prompt" "gui=".s:prompt_color.attr "guifg=".s:prompt_color.fg "guibg=".s:prompt_color.bg
exe "hi Lf_hl_popup_normalMode" "gui=".s:prompt_color.attr "guifg=".s:prompt_color.fg "guibg=".s:prompt_color.bg
exe "hi Lf_hl_popup_inputMode" "gui=".s:status_line_insert_color.attr "guifg=".s:status_line_insert_color.fg "guibg=".s:status_line_insert_color.bg
exe "hi Lf_hl_popup_category" "gui=".s:popup_window_color.attr "guifg=".s:gutter_yellow_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_popup_fullPathMode" "gui="s:popup_window_color.attr "guifg=" .s:gutter_yellow_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_popup_fuzzyMode" "gui=".s:popup_window_color.attr "guifg=".s:gutter_yellow_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_popup_regexMode" "gui=".s:popup_window_color.attr "guifg=".s:gutter_yellow_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_popup_cwd" "gui=".s:popup_window_color.attr "guifg=".s:status_line_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_popup_lineInfo" "gui=".s:popup_window_color.attr "guifg=".s:gutter_yellow_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_popup_total" "gui=".s:popup_window_color.attr "guifg=".s:gutter_yellow_color.fg "guibg=".s:popup_window_color.bg
exe "hi Lf_hl_cursorline" "gui=none" "guifg=none" "guibg=none"
exe "hi Lf_hl_match" "gui=".s:match_color.attr "guifg=".s:match_color.fg "guibg=none"
exe "hi Lf_hl_bufNumber" "gui=".s:line_number.attr "guifg=".s:line_number.fg "guibg=none"
exe "hi Lf_hl_bufIndicators" "gui=none" "guifg=".s:gutter_blue_color.fg "guibg=none"
exe "hi Lf_hl_bufDirname" "gui=none" "guifg=".s:gutter_blue_color.fg "guibg=none"

" coc.nvim
hi link CocHintSign GutterBlue
hi link CocErrorSign GutterRed
hi link CocInfoSign GutterYellow
hi link CocWarningSign GutterOrange
hi link CocHintFloat MessageFloatBlue
hi link CocErrorFloat MessageFloatRed
hi link CocWarningFloat MessageFloatOrange
hi link CocInfoFloat MessageFloatYellow
