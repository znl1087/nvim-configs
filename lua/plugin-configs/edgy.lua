require("edgy").setup({
    bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
            ft = "toggleterm",
            size = { height = 1 },
            -- exclude floating windows
            filter = function(buf, win)
                return vim.api.nvim_win_get_config(win).relative == ""
            end,
        },
        {
            title = "GitCommit",
            ft = "gitcommit",
        },
    },
    left = {
        -- Neo-tree filesystem always takes half the screen height
        {
            title = "Nvim Tree",
            ft = "NvimTree",
            size = { width = 0.15 },
        },
    },
    right = {
        {
            title = "Fugitive",
            ft = "fugitive",
        },
        {
            title = "GitCommit",
            ft = "gitcommit",
        },
    }
})
