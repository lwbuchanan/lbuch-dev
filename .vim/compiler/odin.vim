" Vim compiler file
" Compiler:         Odin Compiler

if exists('current_compiler')
    finish
endif
let current_compiler = "odin"

CompilerSet makeprg=odin\ $*\ .\ -error-pos-style:unix

augroup OdinQuickFixHooks
    autocmd!
    "autocmd QuickFixCmdPre make call cargo#quickfix#CmdPre()
    "autocmd QuickFixCmdPost make call cargo#quickfix#CmdPost()
augroup END
