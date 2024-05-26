require("telescope").load_extension("recent_files")
vim.keymap.set("n", "<leader>rf", ":Telescope oldfiles<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>pj", ":Telescope projects<CR>", {silent = true})
