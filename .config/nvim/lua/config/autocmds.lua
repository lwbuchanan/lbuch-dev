vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.cc", "*.c++" },
    command = "setlocal shiftwidth=2 | setlocal tabstop=2",
})
