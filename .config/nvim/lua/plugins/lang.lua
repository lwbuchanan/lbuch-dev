-- Language features - LSP, completion, etc.

vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    {
        src = 'https://github.com/Saghen/blink.cmp',
        version = vim.version.range('v1.*')
    },
    {
        src = 'https://github.com/chomosuke/typst-preview.nvim',
        version = vim.version.range('v1.*')
    },
})

-- Completion
require 'blink.cmp'.setup()

-- Lua
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

-- Typst
require('typst-preview').setup()

vim.lsp.enable({
    'lua_ls',
    'clangd',
    'rust_analyzer',
    'tinymist',
})

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.diagnostic.config({ update_in_insert = true, float = true, virtual_lines = true })

vim.keymap.set('n', '<leader>td', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

