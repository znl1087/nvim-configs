require("fzf-lua").setup {}
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<C-e>", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set("n", "<C-p>", "<cmd>lua require('fzf-lua').commands()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fa", "<cmd>lua require('fzf-lua').grep_project()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gco", "<cmd>lua require('fzf-lua').git_branches()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gst", "<cmd>lua require('fzf-lua').git_status()<CR>", { silent = true })
