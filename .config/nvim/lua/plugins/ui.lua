return {
    { -- Bottom bar
        'nvim-lualine/lualine.nvim',
        lazy = false,
        priority = 1000,
        init = function()
            vim.o.showmode = false
        end,
        opts = {
            options = {
                icons_enabled = false,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_a = { { function() return ' ' end, padding = { left = 0, right = 0 } } },
                lualine_b = {},
                lualine_c = {
                    { 'mode',     fmt = function(str) return str:sub(1, 1) end, },
                    'filesize',
                    { 'filename', color = { gui = 'bold' }, },
                    'location',
                    {
                        'lsp_status',
                        symbols = {
                            spinner = {},
                            done = '',
                            separator = ' ',
                        },
                        show_name = true,
                    },
                    { 'diagnostics', sections = { 'error', 'warn', } },
                },
                lualine_x = {
                    { 'encoding',   fmt = string.upper },
                    { 'fileformat', fmt = string.upper },
                    'branch',
                    'diff',
                },
                lualine_y = {},
                lualine_z = { { function() return ' ' end, padding = { left = 0, right = 0 } } },
            },
            extensions = {
                'oil',
                'quickfix'
            },
        },
    },
    {
        'nvim-mini/mini.starter', version = '*',
        opts = {},
        lazy = false,
    },
}
