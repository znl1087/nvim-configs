local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
require("telescope").setup({
    buffers = {
        mappings = {
            i = {
                ["<c-d>"] = actions.delete_buffer,
            }
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        }
    }
})
require("telescope").load_extension("recent_files")
require("telescope").load_extension("ui-select")
vim.keymap.set("n", "<leader>rf", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sa", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sf", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sb", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pj", ":Telescope projects<CR>", { silent = true })
vim.keymap.set("n", "<space>aa",
    function()
        builtin.diagnostics()
    end
    , { silent = true })
vim.keymap.set("n", "<space>ac",
    function()
        builtin.diagnostics({ bufnr = 0 })
    end
    , { silent = true })
vim.keymap.set("n", "<space>c", ":Telescope commands<CR>", { silent = true })
