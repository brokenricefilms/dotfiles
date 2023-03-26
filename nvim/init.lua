vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
  "tpope/vim-sleuth",
  { 
    "rose-pine/neovim",
    name = 'rose-pine' 
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = "all",
      highlight = { enable = true },
      indent = { enable = true, disable = { 'python' } },
    },
  },
  {
    "windwp/nvim-spectre",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {"<leader>S", function() require("spectre").open() end, desc = "Open Spectre" },
      {"<leader>sw", function() require("spectre").open_visual({select_word=true}) end, desc = "Search current word" },
      {"<leader>sp", function() require("spectre").open_file_search({select_word=true}) end, desc = "Search on current file" },
    },
  },
  {
    "Pocco81/auto-save.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
})

vim.cmd('colorscheme rose-pine-dawn')

vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.completeopt = 'menuone,noinsert,noselect'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statusline = '%F'
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪"
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

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

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', '<leader>q', ':q<enter>')
vim.keymap.set('n', '<leader>Q', ':qa!<enter>')

vim.keymap.set('', '<Right>', '<C-w><')
vim.keymap.set('', '<Down>', '<C-w>-')
vim.keymap.set('', '<Up>', '<C-w>+')
vim.keymap.set('', '<Left>', '<C-w>>')

vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

vim.keymap.set('n', 'gf', ':cd %:h<enter>:edit <cfile><enter>')
