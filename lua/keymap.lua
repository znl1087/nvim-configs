-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true -- do not show message
}

local api = require("nvim-tree.api")
vim.keymap.set("n", "<Leader>tg", api.tree.toggle, opts)
vim.keymap.set("n", "<Leader>fd", ":NvimTreeFindFile<CR>", opts)
