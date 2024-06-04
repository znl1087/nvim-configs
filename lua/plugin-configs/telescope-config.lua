local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
require("telescope").setup({
    buffers = {
        mappings = {
            i = {
                ["<c-d>"] = actions.delete_buffer,
            }
        }
    }
})
require("telescope").load_extension("recent_files")
vim.keymap.set("n", "<leader>rf", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pj", ":Telescope projects<CR>", { silent = true })
vim.keymap.set("n", "<space>aa",
    function()
        builtin.diagnostics()
    end
    , { silent = true })
vim.keymap.set("n", "<space>ac",
    function()
        builtin.diagnostics({ bufnr = 0 })
    end
    , { silent = true })
vim.keymap.set("n", "<space>c", ":Telescope commands<CR>", { silent = true })
