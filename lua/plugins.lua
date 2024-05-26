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
    {"ibhagwan/fzf-lua", dependencies = {"nvim-tree/nvim-web-devicons"}},
    {"nvimdev/dashboard-nvim", event = "VimEnter", dependencies = {{"nvim-tree/nvim-web-devicons"}}},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = {"nvim-lua/plenary.nvim"}},
    {"smartpde/telescope-recent-files"},
    {"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}},
    {"numToStr/Comment.nvim", opts = {}, lazy = false},
    {
      "mrcjkb/rustaceanvim",
      version = "^4", -- Recommended
      lazy = false -- This plugin is already lazy
    },
    {
      "MaximilianLloyd/ascii.nvim",
      requires = {
        "MunifTanjim/nui.nvim"
      }
    },
    "MunifTanjim/nui.nvim",
    -- {
    --   "startup-nvim/startup.nvim",
    --   requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    --   config = function()
    --     require "startup".setup({theme = "startify"})
    --   end
    -- },
    "nvim-tree/nvim-tree.lua",
    "tanvirtin/monokai.nvim",
    "mhartington/formatter.nvim",
    "equalsraf/neovim-gui-shim",
    "github/copilot.vim",
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "pocco81/auto-save.nvim",
    "ggandor/leap.nvim",
    "ahmedkhalf/project.nvim",
    "nvim-lua/plenary.nvim",
    "tpope/vim-surround",
    "tpope/vim-fugitive"
  }
)
require("auto-save").setup()
require("plugin-configs.nvim-tree")
require("plugin-configs.formatter-nvim")
require("plugin-configs.coc")
require("plugin-configs.toggleterm")
require("plugin-configs.leap")
require("plugin-configs.bufferline")
require("plugin-configs.gitsigns")
require("plugin-configs.fzf-lua")
require("plugin-configs.project")
require("plugin-configs.lualine")
require("plugin-configs.dashboard-nvim")
require("plugin-configs.treesitter")
require("plugin-configs.telescope")
require("plugin-configs.ibl")
require("plugin-configs.comment")
require("plugin-configs.rustaceanvim")
