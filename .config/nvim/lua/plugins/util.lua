vim.pack.add({
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
})

require('telescope').setup {
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
}
local telescope = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>pf', telescope.git_files)
vim.keymap.set('n', '<leader>lg', telescope.live_grep)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>gs', telescope.grep_string)
vim.keymap.set('n', '<leader>fb', telescope.buffers)
vim.keymap.set('n', '<leader>fc', telescope.colorscheme)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)
vim.keymap.set('n', '<leader>fk', telescope.keymaps)
vim.keymap.set('n', 'z=', telescope.spell_suggest)


require('oil').setup()
vim.keymap.set('n', '<leader>e', "<Cmd>Oil --float --preview<CR>")
