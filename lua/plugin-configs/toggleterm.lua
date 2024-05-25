require("toggleterm").setup {}
local Terminal = require("toggleterm.terminal").Terminal
local term_table = {}

function _powershell_toggle()
-- 获取当前目录
  local cwd = vim.fn.getcwd()


  -- 检查是否已经有一个终端在当前目录下运行
  if term_table[cwd] then
    term_table[cwd]:toggle()
  else
    -- 如果没有找到打开的PowerShell终端，则创建一个新的
    local Terminal = require('toggleterm.terminal').Terminal
    local powershell = Terminal:new({ cmd="powershell", dir = cwd, hidden = true })
    powershell:toggle()
    -- 将新的终端实例存储在表中
    term_table[cwd] = powershell
  end
end

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _powershell_toggle()<CR>", {noremap = true, silent = true})

--function _G.set_terminal_keymaps()
  -- local opts = {buffer = 0}
  -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
--end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
--vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
