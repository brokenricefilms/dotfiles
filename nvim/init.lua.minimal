vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.completeopt = 'menuone,noinsert,noselect'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.ch = 0

vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.cache/nvim'
vim.opt.undolevels = 10000

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.opt.hidden = true
vim.opt.history = 100
vim.opt.lazyredraw = true
vim.opt.updatetime = 100

vim.cmd [[colorscheme shine]]

vim.opt.shortmess:append "sI"

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

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')
vim.keymap.set('', '<Right>', '<C-w><')
vim.keymap.set('', '<Down>', '<C-w>-')
vim.keymap.set('', '<Up>', '<C-w>+')
vim.keymap.set('', '<Left>', '<C-w>>')
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('n', 'gf', ':cd %:h<enter>:edit <cfile><enter>')
