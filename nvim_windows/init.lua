vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.background = "light"
vim.cmd("colorscheme shine")

vim.opt.clipboard = "unnamedplus"

vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.completeopt = "menuone,noinsert,noselect"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪"
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.statusline = " %F %m %< %= %r %q"
vim.opt.cursorline = true

vim.opt.hidden = true
vim.opt.history = 100
vim.opt.lazyredraw = true
vim.opt.updatetime = 100

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<Right>", "<C-w><")
vim.keymap.set("n", "<Down>", "<C-w>-")
vim.keymap.set("n", "<Up>", "<C-w>+")
vim.keymap.set("n", "<Left>", "<C-w>>")

vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

vim.keymap.set("n", "gf", ":cd %:h<enter>:edit <cfile><enter>")

vim.keymap.set("n", "<leader><space>", "<C-^>")

vim.keymap.set("n", "<leader>l", "<C-w>v:e %:h<enter>", { silent = true })

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})
