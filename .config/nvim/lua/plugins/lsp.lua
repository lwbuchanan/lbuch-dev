return {
    {
        'neovim/nvim-lspconfig',
        event = 'VeryLazy',
        dependencies = {
            {
                'saghen/blink.cmp',
                version = '1.*',
                opts = {
                    keymap = { preset = 'default' },
                    completion = {
                        documentation = { auto_show = true },
                        menu = {
                            auto_show = false,
                            draw = {
                                columns = { { 'label', 'label_description', gap = 1 } },
                            }
                        },
                        ghost_text = {
                            enabled = true,
                            show_with_menu = false
                        }
                    },
                },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                opts_extend = { "sources.default" }
            },
            {

                'mason-org/mason-lspconfig.nvim',
                dependencies = {
                    { 'mason-org/mason.nvim', opts = {} },
                },
                opts = {
                    ensure_installed = {
                        'lua_ls',
                        'gopls',
                        'tinymist',
                        'rust_analyzer',
                        'clangd',
                    },
                    automatically_enable = {
                        exclude = {
                        }
                    }
                },
            },
            {
                "rachartier/tiny-inline-diagnostic.nvim",
                event = "VeryLazy",
                priority = 1000,
                opts = {
                    preset = "minimal",
                },
            },
        },
        config = function()
            -- vim.lsp.inlay_hint.enable(true)

            -- Server config
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        }
                    }
                }
            })
            -- vim.lsp.config('clangd', {
            --
            -- })
        end,
        keys = {
                { 'gD',  vim.lsp.buf.declaration,       desc = 'Goto Declaration' },
                { 'grf', vim.lsp.buf.format,            desc = 'Format Buffer' },
                { 'gra', vim.lsp.buf.code_action,       desc = 'Code Action' },
            }
    },

    -- Language Specific Plugins
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}
