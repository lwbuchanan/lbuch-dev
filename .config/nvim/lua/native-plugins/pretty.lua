-- Aesthetic plugins: colors, ui, etc.

local colors = {
    'sainnhe/sonokai',
}

for _, color in ipairs(colors) do
    vim.pack.add({ { src = ('https://github.com/' .. color) } })
end

vim.g.sonokai_style = 'shusia'
vim.g.sonokai_better_performance = 1
vim.o.background = 'dark'
vim.cmd("colorscheme sonokai")

vim.pack.add({
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
})

require('lualine').setup {
    options = {
        icons_enabled = false,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 3) end } },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename' },
        lualine_x = { '' },
        lualine_y = { 'diagnostics', 'lsp_status' },
        lualine_z = { 'location' }
    },
    extensions = {
        'oil'
    }
}
vim.o.showmode = false

-- require('mini.starter').setup()
-- require 'nvim-treesitter.configs'.setup({
--     ensure_installed = { "c", "cpp", "lua", "typst", "go", "rust" },
--     highlight = { enable = true }
-- })
