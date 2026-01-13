return {
    {
        'stevearc/oil.nvim',
        event = 'VeryLazy',
        opts = {
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },

        },
        keys = {
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = { "c", "cpp", "lua", "typst", "go", "rust" },
            highlight = { enable = true }
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            current_line_blame = true,
        },
    },
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-ui-select.nvim',
                init = function()
                    require('telescope').load_extension("ui-select")
                end
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        opt = {
            pickers = { colorscheme = { enable_preview = true } },
            extensions = {
                ["ui-select"] = {}
            }
        },
        keys = function()
            local builtin = require('telescope.builtin')
            return {
                { '<leader><leader>', builtin.buffers,                   desc = 'Buffers' },
                { '<leader>.',        builtin.find_files,                desc = 'Files' },

                { '<leader>sg',       builtin.live_grep,                 desc = 'Search with Grep' },
                { '<leader>sb',       builtin.current_buffer_fuzzy_find, desc = 'Search Buffer' },
                { '<leader>ss',       builtin.grep_string,               mode = { 'n', 'v', 'x' }, desc = 'Grep String' },

                { '<leader>fc',       builtin.colorscheme,               desc = 'Find Colorscheme' },
                { '<leader>fh',       builtin.help_tags,                 desc = 'Find Help' },
                { '<leader>fm',       builtin.man_pages,                 desc = 'Find Man Page' },
                { '<leader>fk',       builtin.keymaps,                   desc = 'Find Keymap' },
                { '<leader>fq',       builtin.quickfix,                  desc = 'Quickfix' },
                { '<leader>fl',       builtin.loclist,                   desc = 'Location List' },

                { 'z=',               builtin.spell_suggest,             desc = 'Suggest Spelling' },

                { '<leader>gf',       builtin.git_files,                 desc = 'Project Files' },
            }
        end,
    },
}
