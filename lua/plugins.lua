local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system(
    {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath
    }
  )
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup(
  {
    {"neoclide/coc.nvim", branch = "release"},
    {"akinsho/toggleterm.nvim", version = "*", config = true},
    {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = {"nvim-tree/nvim-web-devicons"},
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
      end
    },
    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      config = function()
        require("dashboard").setup {}
      end,
      dependencies = {{"nvim-tree/nvim-web-devicons"}}
    },
    "nvim-tree/nvim-tree.lua",
    "tanvirtin/monokai.nvim",
    "mhartington/formatter.nvim",
    "equalsraf/neovim-gui-shim",
    "github/copilot.vim",
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim"
  }
)

require("ibl").setup()
require("gitsigns").setup()
require("plugin-configs.nvim-tree")
require("plugin-configs.formatter-nvim")
require("plugin-configs.coc")
require("plugin-configs.toggleterm")
