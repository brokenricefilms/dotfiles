local opt = vim.opt

opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.completeopt = 'menuone,noinsert,noselect'

opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = true
opt.linebreak = true
opt.scrolloff = 5
opt.termguicolors = true
opt.laststatus = 0
opt.cmdheight = 0
opt.cursorline = true
opt.cursorlineopt = 'number'

opt.undofile = true
opt.undodir = os.getenv('HOME') .. '/.cache/nvim'
opt.undolevels = 10000

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.updatetime = 100

vim.cmd [[colorscheme shine]]

opt.shortmess:append "sI"

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

map('n', 'ss', ':split<Return><C-w>w')
map('n', 'sv', ':vsplit<Return><C-w>w')

map('', '<Right>', '<C-w><')
map('', '<Down>', '<C-w>-')
map('', '<Up>', '<C-w>+')
map('', '<Left>', '<C-w>>')

map('x', '<', '<gv')
map('x', '>', '>gv')

map('n', 'gf', ':cd %:h<enter>:edit <cfile><enter>')

map('n', 'cd.', ':cd %:h<enter>')
map('n', 'cd', ':cd<enter>')
map('n', 'cdr', ':cd %:h<enter>:cd `git rev-parse --show-toplevel`<enter>')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '50' })
  end
})

augroup('jump_last_position', { clear = true })
autocmd("BufReadPost",{
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
    if {row, col} ~= {0, 0} then
      vim.api.nvim_win_set_cursor(0, {row, 0})
    end
  end,
  group = 'jump_last_position'
})

autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
  'yaml', 'lua'
},
command = 'setlocal shiftwidth=2 tabstop=2'
})
