local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

map('n', '<leader>r', ':so % | silent source ~/.config/nvim/init.lua | silent !tmux source-file ~/.tmux.conf<enter>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', 'Q', ':qa!<CR>')
map('n', '<leader>o', ':wq<CR>')

map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '*', '*zz')
map('n', '#', '#zz')

map('n', '<leader><space>', '<c-^>')

map('n', 'ss', ':split<Return><C-w>w')
map('n', 'sv', ':vsplit<Return><C-w>w')

map('', '<Right>', '<C-w><')
map('', '<Down>', '<C-w>-')
map('', '<Up>', '<C-w>+')
map('', '<Left>', '<C-w>>')

map('x', '<', '<gv')
map('x', '>', '>gv')
