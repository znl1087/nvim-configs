require("project_nvim").setup(
    {
        detection_methods = { "pattern" },
        silent_chdir = true
    }
)


-- nvim 0.10.0
-- auto change root
-- vim.api.nvim_create_autocmd(
--   "BufEnter",
--   {
--     callback = function(ctx)
--       local root = vim.fs.root(ctx.buf, {".git", ".svn", "Makefile", "mvnw", "package.json"})
--       if root and root ~= "." and root ~= vim.fn.getcwd() then
--         ---@diagnostic disable-next-line: undefined-field
--         vim.cmd.cd(root)
--         vim.notify("Set CWD to " .. root)
--       end
--     end
--   }
-- )
require("telescope").load_extension("projects")
