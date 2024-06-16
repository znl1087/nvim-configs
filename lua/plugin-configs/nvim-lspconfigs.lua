local lspconfig = require('lspconfig')
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- local bufnr = vim.api.nvim_get_current_buf()
    vim.keymap.set("n", "<Leader>a",
        function()
            -- vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
            vim.lsp.buf.code_action()
        end, opts)
    vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "<Space>f",
        function()
            vim.lsp.buf.format({ async = true })
        end,
        opts
    )
end
local signs = {
    Error = " ",
    Warn = "⚠ ",
    Hint = " ",
    Infor = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspconfig.vimls.setup {
    on_attach = on_attach
}

lspconfig.pyright.setup {
    on_attach = on_attach
}

lspconfig.tsserver.setup {
    on_attach = on_attach
}

lspconfig.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end
    end,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach
}
