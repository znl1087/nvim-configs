require("toggleterm").setup{}
local Terminal  = require('toggleterm.terminal').Terminal

-- define powershell float terminal
local powershell = Terminal:new({ cmd = "powershell", hidden = true, direction = "horizontal" })
function _powershell_toggle()
  powershell:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _powershell_toggle()<CR>", {noremap = true, silent = true})

-- define wsl in windows float terminal
local bash = Terminal:new({ cmd = "ubuntu", hidden = true, direction = "float" })
function _bash_toggle()
  bash:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>sh", "<cmd>lua _bash_toggle()<CR>", {noremap = true, silent = true})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
