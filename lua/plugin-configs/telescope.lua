require("telescope").load_extension("recent_files")
vim.keymap.set(
  "n",
  "<leader>rf",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true}
)
vim.keymap.set("n", "<leader>pj", ":Telescope projects<CR>", {silent = true})
