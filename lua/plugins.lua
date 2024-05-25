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
    {"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"},
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = {"nvim-tree/nvim-web-devicons"},
      config = function()
        require("fzf-lua").setup {}
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
    "lewis6991/gitsigns.nvim",
    "pocco81/auto-save.nvim",
    "ggandor/leap.nvim",
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup(
          {
            ensure_installed = {"c", "lua", "vim", "vimdoc", "rust", "python", "javascript", "html"},
            sync_install = false,
            highlight = {enable = true},
            indent = {enable = true}
          }
        )
      end
    }
  }
)
require("auto-save").setup()
require("ibl").setup()
require("plugin-configs.nvim-tree")
require("plugin-configs.formatter-nvim")
require("plugin-configs.coc")
require("plugin-configs.toggleterm")
require("plugin-configs.leap")
require("plugin-configs.bufferline")
require("plugin-configs.gitsigns")
require("plugin-configs.fzf-lua")
