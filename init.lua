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

vim.cmd [[colorscheme zellner]]

opt.shortmess:append "sI"

local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true
    }
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
