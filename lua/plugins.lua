---@diagnostic disable: undefined-field
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
        -- {"neoclide/coc.nvim", branch = "release"},
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            config = true
        },
        {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
                require("copilot").setup({})
            end,
        },
        {
            "zbirenbaum/copilot-cmp",
            config = function()
                require("copilot_cmp").setup()
            end
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {}
        },
        {
            "akinsho/bufferline.nvim",
            version = "*",
            dependencies = "nvim-tree/nvim-web-devicons",
            opts = function()
                local Offset = require("bufferline.offset")
                if not Offset.edgy then
                    local old_get = Offset.get
                    Offset.get = function()
                        if package.loaded.edgy then
                            local layout = require("edgy.config").layout
                            local ret = { left = "", left_size = 0, right = "", right_size = 0 }
                            for _, pos in ipairs({ "left", "right" }) do
                                local sb = layout[pos]
                                if sb and #sb.wins > 0 then
                                    local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
                                    ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
                                    ret[pos .. "_size"] = sb.bounds.width
                                end
                            end
                            ret.total_size = ret.left_size + ret.right_size
                            if ret.total_size > 0 then
                                return ret
                            end
                        end
                        return old_get()
                    end
                    Offset.edgy = true
                end
            end,
        },
        {"ibhagwan/fzf-lua", dependencies = {"nvim-tree/nvim-web-devicons"}},
        {
            "nvimdev/dashboard-nvim",
            event = "VimEnter",
            dependencies = { { "nvim-tree/nvim-web-devicons" } }
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate"
        },
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.6",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        {
            "kevinhwang91/nvim-ufo",
            dependencies = { "kevinhwang91/promise-async" }
        },
        {
            "folke/edgy.nvim",
            event = "VeryLazy",
            init = function()
                vim.opt.laststatus = 3
                vim.opt.splitkeep = "screen"
            end,
        },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" }
        },
        "nvim-telescope/telescope-ui-select.nvim",
        { "smartpde/telescope-recent-files" },
        {
            "numToStr/Comment.nvim",
            opts = {},
            lazy = false
        },
        {
            "mrcjkb/rustaceanvim",
            version = "^4", -- Recommended
            lazy = false    -- This plugin is already lazy
        },
        -- {
        --     "ziontee113/icon-picker.nvim",
        --     config = function()
        --         require("icon-picker").setup({ disable_legacy_commands = true })
        --
        --         local opts = { noremap = true, silent = true }
        --
        --         vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
        --         vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
        --         vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
        --     end
        -- },
        {
            "folke/trouble.nvim",
            opts = {}, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
            keys = {
                {
                    "<leader>xx",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "Diagnostics (Trouble)",
                },
                {
                    "<leader>xX",
                    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                    desc = "Buffer Diagnostics (Trouble)",
                },
                {
                    "<leader>cs",
                    "<cmd>Trouble symbols toggle focus=false<cr>",
                    desc = "Symbols (Trouble)",
                },
                {
                    "<leader>cl",
                    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                    desc = "LSP Definitions / references / ... (Trouble)",
                },
                {
                    "<leader>xL",
                    "<cmd>Trouble loclist toggle<cr>",
                    desc = "Location List (Trouble)",
                },
                {
                    "<leader>xQ",
                    "<cmd>Trouble qflist toggle<cr>",
                    desc = "Quickfix List (Trouble)",
                },
            },
        },
        -- {
        --     "windwp/nvim-autopairs",
        --     event = "InsertEnter",
        --     config = true
        -- },
        {
            "MaximilianLloyd/ascii.nvim",
            requires = {
                "MunifTanjim/nui.nvim"
            }
        },
        {
            "onsails/lspkind.nvim",
            event = { "VimEnter" },
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "lspkind.nvim",
                "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
                "hrsh7th/cmp-buffer",   -- buffer auto-completion
                "hrsh7th/cmp-path",     -- path auto-completion
                "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
                "saadparwaiz1/cmp_luasnip",
            },
        },
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
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
        "nvim-tree/nvim-web-devicons",
        "lewis6991/gitsigns.nvim",
        -- "pocco81/auto-save.nvim",
        "ggandor/leap.nvim",
        "ahmedkhalf/project.nvim",
        "nvim-lua/plenary.nvim",
        "tpope/vim-surround",
        "nvim-lua/lsp-status.nvim",
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "petertriho/nvim-scrollbar",
        "chaoren/vim-wordmotion",
        "sindrets/diffview.nvim",
        "sitiom/nvim-numbertoggle",
        "tpope/vim-fugitive"
    }
)
-- require("auto-save").setup()
require("plugin-configs.nvim-tree")
require("plugin-configs.formatter-nvim")
-- require("plugin-configs.coc")
require("plugin-configs.toggleterm")
require("plugin-configs.leap")
require("plugin-configs.bufferline")
require("plugin-configs.gitsigns")
require("plugin-configs.fzf-lua")
require("plugin-configs.project")
require("plugin-configs.lualine")
require("plugin-configs.dashboard-nvim")
require("plugin-configs.treesitter")
require("plugin-configs.telescope-config")
require("plugin-configs.ibl")
require("plugin-configs.comment")
require("plugin-configs.rustaceanvim")
require("plugin-configs.nvim-cmp")
require("plugin-configs.mason")
require("plugin-configs.nvim-lspconfigs")
require("plugin-configs.scroll-bar")
require("plugin-configs.ufo")
require("plugin-configs.luasnip")
require("plugin-configs.edgy")
