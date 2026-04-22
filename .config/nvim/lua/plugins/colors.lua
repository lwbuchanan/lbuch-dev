return {
    -- Enabled
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = 'dark'
            vim.cmd("colorscheme carbonfox")
        end
    },

    -- All colors
    {
        'sainnhe/sonokai',
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },
    {
        'sainnhe/everforest',
    },
    {
        "EdenEast/nightfox.nvim",
    },
}
