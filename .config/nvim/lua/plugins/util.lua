return {
    {
        'stevearc/oil.nvim',
        lazy = false,
        opts = {
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },

        },
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            current_line_blame = true,
        },
    },
    {
        "chentoast/marks.nvim",
        event = "BufEnter",
        opts = {},
    },
    {
        "romus204/tree-sitter-manager.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = { "c", "c3", "cpp", "go", "rust", "python", "lua" },
            auto_install = true,
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            image = { enabled = true },
            indent = {
                enabled = true,
                animate = { enabled = false }
            },
            lazygit = {
                enabled = true,
                config = {
                    gui = {
                        nerdFontsVersion = "",
                    }
                },
            },
            picker = {
                prompt = "> ",
                layout = {
                    preset = 'telescope',
                },
                icons = {
                    files = {
                        enabled = false,
                    },
                    keymaps = {
                        nowait = ".."
                    },
                    undo = {
                        saved = "S ",
                    },
                    ui = {
                        live       = "l ",
                        hidden     = "h",
                        ignored    = "i",
                        follow     = "f",
                        selected   = "> ",
                        unselected = ". ",
                    },
                    git = {
                        enabled = false
                    },
                    diagnostics = {
                        Error = "E ",
                        Warn  = "W ",
                        Hint  = "H ",
                        Info  = "I ",
                    },
                    lsp = {
                        unavailable = "x",
                        enabled = "1",
                        disabled = "0 ",
                        attached = "! "
                    },
                },
            },
        },
        keys = {
            -- Finding
            { '<leader><space>', function() Snacks.picker.buffers() end,               desc = 'Buffers' },
            { "<leader>.",       function() Snacks.picker.files() end,                 desc = "Files" },
            { "<leader>fc",      function() Snacks.picker.colorschemes() end,          desc = "Colorscheme" },
            { "<leader>fh",      function() Snacks.picker.help() end,                  desc = "Help Pages" },
            { "<leader>fm",      function() Snacks.picker.man() end,                   desc = "Man Pages" },
            { "<leader>fk",      function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
            { "<leader>fq",      function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
            { "<leader>fl",      function() Snacks.picker.loclist() end,               desc = "Location List" },
            { "<leader>fp",      function() Snacks.picker.projects() end,              desc = "Projects" },
            { "<leader>fr",      function() Snacks.picker.recent() end,                desc = "Recent" },

            -- Searching
            { "<leader>sg",      function() Snacks.picker.grep() end,                  desc = "Grep" },
            { "<leader>sb",      function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
            { "<leader>ss",      function() Snacks.picker.grep_word() end,             desc = "Grep String",          mode = { "n", "x" } },

            -- Git
            { "<leader>gf",      function() Snacks.picker.git_files() end,             desc = "Find Git Files" },
            { "<leader>gd",      function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
            { "<leader>gg",      function() Snacks.lazygit() end,                      desc = "Lazygit" },
            { "<leader>gl",      function() Snacks.lazygit.log() end,                  desc = "Lazygit log" },

            -- LSP
            { "grd",             function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
            { "grD",             function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
            { "gd",              function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
            { "gD",              function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
            { "gri",             function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
            { "grr",             function() Snacks.picker.lsp_references() end,        nowait = true,                 desc = "References" },
            { "grt",             function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto Type Definition" },
            { "gO",              function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
            { "go",              function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

            -- Misc Actions
            { 'z=',              function() Snacks.picker.spelling() end,              desc = 'Suggest Spelling' },
        },
    }
}
