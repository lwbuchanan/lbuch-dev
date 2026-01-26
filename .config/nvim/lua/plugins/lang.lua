return {
    -- LSP
    {
        'neovim/nvim-lspconfig',
        event = 'VeryLazy',
        dependencies = {
            {
                'j-hui/fidget.nvim',
                opts = {
                    progress = {
                        display = {
                            done_icon = "Done",
                            progress_icon = { "line" },
                            overrides = {
                                rust_analyzer = { name = "rust-analyzer" },
                            },
                        },
                    }
                }
            },
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
                                columns = { { 'kind' }, { 'label', 'label_description', gap = 1 } },
                                components = {
                                    kind = {
                                        ellipsis = true,
                                        width = { fill = false },
                                        text = function(ctx) return ctx.kind:sub(1, 3) end,
                                    },
                                }
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
                        'asm_lsp',
                        'gopls',
                        'tinymist',
                        'rust_analyzer',
                        'clangd',
                    },
                    automatically_enable = { exclude = {} }
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
            -- Diagnostics
            vim.diagnostic.config {
                -- underline = { vim.diagnostic.severity.ERROR },
                -- float = true,
                -- update_in_insert = true,
                -- severity_sort = true,
                -- virtual_lines = true,
                -- signs = {
                --     text = {
                --         [vim.diagnostic.severity.ERROR] = 'E',
                --         [vim.diagnostic.severity.WARN] = 'W',
                --         [vim.diagnostic.severity.HINT] = 'H',
                --         [vim.diagnostic.severity.INFO] = 'I',
                --     },
                -- },
            }

            -- Inlay hints
            vim.lsp.inlay_hint.enable(true)

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
        end,
        keys = function()
            local builtin = require('telescope.builtin')
            return {
                { 'grd', builtin.diagnostics,           desc = 'Goto Diagnostic' },
                { 'gri', builtin.lsp_implementations,   desc = 'Goto Implementation' },
                { 'grt', builtin.lsp_type_definitions,  desc = 'Goto Type Definition' },
                { 'grr', builtin.lsp_references,        desc = 'Goto References' },
                { 'gO',  builtin.lsp_document_symbols,  desc = 'Goto Document Symbols' },
                { 'go',  builtin.lsp_workspace_symbols, desc = 'Goto Workspace Symbols' },
                { 'gd',  builtin.lsp_definitions,       desc = 'Goto Definition' },
                { 'gD',  vim.lsp.buf.declaration,       desc = 'Goto Declaration' },
                { 'grf', vim.lsp.buf.format,            desc = 'Format Buffer' },
                { 'gra', vim.lsp.buf.code_action,       desc = 'Code Action' },
            }
        end,
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
