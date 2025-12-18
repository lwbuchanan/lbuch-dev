return {
    { 
        'stevearc/oil.nvim',
        event = 'VeryLazy',
        opts = {},
        keys = {
            { '<leader>e', "<Cmd>Oil --preview<CR>" },
        },
    },

    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        opt = {
            pickers = {colorscheme = {enable_preview = true}}
        },
        keys = function()
            local builtin = require('telescope.builtin')
            return {
                { '<leader>ff', builtin.find_files, desc = 'Find Files' },
                { '<leader>pf', builtin.git_files, desc = 'Project Files' },
                { '<leader>lg', builtin.live_grep, desc = 'Live Grep' },
                { '<leader>gs', builtin.grep_string, mode = {'n', 'v', 'x'}, desc = 'Grep String' },
                { '<leader>fb', builtin.buffers, desc = 'Find Buffers' },
                { '<leader>fc', builtin.colorscheme, desc = 'Find Colorscheme' },
                { '<leader>fh', builtin.help_tags, desc = 'Find Help' },
                { '<leader>fk', builtin.keymaps, desc = 'Find Keymap' },
                { 'z=', builtin.spell_suggest, desc = 'Suggest Spelling' },
                { 'gri', builtin.lsp_implementations, desc = 'Goto Implementation' },
                { 'grd', builtin.lsp_definitions, desc = 'Goto Definition' },
                { 'grD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
            }
        end,
    },
}
