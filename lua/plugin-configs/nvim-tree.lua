-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup(
  {
    sort = {
      sorter = "case_sensitive"
    },
    view = {
      width = 40
    },
    renderer = {
      group_empty = true
    },
    filters = {
      dotfiles = true
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = false,
    update_focused_file = {
      enable = true,
      update_root = true
    }
  }
)

local api = require("nvim-tree.api")
vim.keymap.set("n", "<C-t>", api.tree.toggle, opts)
vim.keymap.set("n", "<Leader>loc", api.tree.find_file, opts)
