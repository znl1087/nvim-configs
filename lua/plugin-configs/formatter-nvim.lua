local status, formatter = pcall(require, "formatter")
if (not status) then
  return
end
formatter.setup {
  filetype = {
    lua = {
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
  }
}

vim.keymap.set("n", "<Leader>f", ":Format<CR>", opts)
