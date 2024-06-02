local actions = require "telescope.actions"
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
vim.keymap.set("n", "<space>a", ":Telescope diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<space>c", ":Telescope commands<CR>", { silent = true })
