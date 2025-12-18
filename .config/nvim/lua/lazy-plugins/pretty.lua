return {
    {
        'sainnhe/sonokai',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_style = 'shusia'
            vim.g.sonokai_better_performance = 1
            vim.o.background = 'dark'
            vim.cmd("colorscheme sonokai")
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
            vim.o.showmode = false
        end,
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
        },
    },
}
