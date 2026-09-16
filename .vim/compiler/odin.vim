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

augroup OdinBufWriteHooks
    autocmd!
    autocmd BufWrite *.odin execute "Make check"
augroup END

nnoremap <LocalLeader>m <Cmd>Make build<CR>
nnoremap <LocalLeader>r <Cmd>Make run<CR>
nnoremap <LocalLeader>c <Cmd>Make check<CR>
