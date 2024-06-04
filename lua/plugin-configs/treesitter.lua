local configs = require("nvim-treesitter.configs")

-- require("nvim-treesitter.install").prefer_git = true
-- require 'nvim-treesitter.install'.compilers = { 'zig' }

configs.setup(
    {
        ensure_installed = { "lua", "vim", "vimdoc", "rust", "python"},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
    }
)
