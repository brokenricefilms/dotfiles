vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.background = 'light'
vim.opt.backspace = {"indent", "eol,start"}
vim.opt.ch = 0
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.history = 100
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.list = off
vim.opt.listchars = { tab = "→ ", eol = "↲", trail = "⋅", extends = "❯", precedes = "❮", space = ".", }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.shortmess:append "sI"
vim.opt.showbreak = "↪"
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.statusline = '%F'
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.ttyfast = true
vim.opt.undodir = os.getenv('HOME') .. '/.cache/nvim'
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 100
vim.opt.wrap = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', 'đ', 'dd')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('', '<Right>', '<C-w><')
vim.keymap.set('', '<Down>', '<C-w>-')
vim.keymap.set('', '<Up>', '<C-w>+')
vim.keymap.set('', '<Left>', '<C-w>>')

vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

vim.keymap.set('n', 'gf', ':cd %:h<enter>:edit <cfile><enter>')

vim.keymap.set('n', '<leader>w', ':w<enter>')

vim.keymap.set('n', '<leader>q', ':q<enter>')

vim.keymap.set('n', '<leader>Q', ':qa!<enter>')

vim.keymap.set('n', '<leader>o', ':wqa<enter>')

vim.keymap.set('n', '<leader>O', ':wqa!<enter>')

vim.api.nvim_create_autocmd('BufRead', {
  callback = function(opts)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
          not (ft:match('commit') and ft:match('rebase'))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
          then
            vim.api.nvim_feedkeys([[g`"]], 'x', false)
            vim.api.nvim_feedkeys([[zz]], 'x', false)
          end
        end,
      })
    end,
})
