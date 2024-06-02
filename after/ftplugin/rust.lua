vim.lsp.inlay_hint.enable(true)
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "<leader>a",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = true, buffer = bufnr }
)
vim.keymap.set(
    "n",
    "gr",
    ":Telescope lsp_references<CR>",
    { silent = true, buffer = bufnr }
)
vim.keymap.set(
    "n",
    "<space>f",
    function()
        vim.lsp.buf.format({ async = true })
    end,
    { silent = true, buffer = bufnr }
)
