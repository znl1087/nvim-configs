-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true   -- do not show message
}
local status, formatter = pcall(require, "formatter")
if (not status) then
    return
end
local util = require "formatter.util"
formatter.setup {
    filetype = {
        lua = {
            function()
                return {
                    exe = "luafmt",
                    args = { "--indent-count", 2, "--stdin" },
                    stdin = true
                }
            end
        },
        python = {
            function()
                return {
                    exe = "autopep8",
                    args = {
                        util.escape_path(util.get_current_buffer_file_path())
                    },
                    stdin = true
                }
            end
        }
    }
}

vim.keymap.set("n", "<Leader>f", ":Format<CR>", opts)
