vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "stevearc/oil.nvim",
    opts = {
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["q"] = {
          callback = function()
            require("oil").close()
            vim.cmd("close")
          end,
        },
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>e", ":FzfLua files<enter>")
      vim.keymap.set("n", "<leader>E", ":FzfLua git_files<enter>")
      vim.keymap.set("n", "<leader>;", ":FzfLua<enter>")
      vim.keymap.set("n", "<leader>j", ":FzfLua live_grep<enter>")
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    },
  },
  {
    "romainl/vim-cool",
    event = "VeryLazy",
  },
  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true, disable = { "python" } },
      ensure_installed = "all",
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["as"] = "@scope",
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "<c-v>",
          },
          include_surrounding_whitespace = true,
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "numToStr/Navigator.nvim",
    event = "VeryLazy",
    config = function()
      require("Navigator").setup()
      vim.keymap.set({ "n", "t" }, "<A-h>", "<CMD>NavigatorLeft<CR>")
      vim.keymap.set({ "n", "t" }, "<A-l>", "<CMD>NavigatorRight<CR>")
      vim.keymap.set({ "n", "t" }, "<A-k>", "<CMD>NavigatorUp<CR>")
      vim.keymap.set({ "n", "t" }, "<A-j>", "<CMD>NavigatorDown<CR>")
      vim.keymap.set({ "n", "t" }, "<A-p>", "<CMD>NavigatorPrevious<CR>")
    end,
  },
}, {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        --"matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  install = { colorscheme = { "zenwritten", "shine" } },
})

vim.opt.background = "light"
vim.cmd("colorscheme zenwritten")

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

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim"
vim.opt.undolevels = 10000

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

vim.keymap.set("n", "<leader>r", ":w<enter>:!run %:p<enter>")

vim.keymap.set("n", "<leader>l", "<C-w>v:e %:h<enter>", { silent = true })

vim.keymap.set("i", ";bash", "#!/usr/bin/env bash<enter><BS><enter><esc>:set filetype=sh<enter>:w<enter>:!chmod +x %:p<enter><enter>", { silent = true })

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
