local configs = require("nvim-treesitter.configs")

require 'nvim-treesitter.install'.compilers = { 'zig' }

configs.setup(
    {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "python", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
    }
)
