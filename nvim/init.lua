vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

require("lazy").setup({
  "tpope/vim-sleuth",
  {
    "gpanders/editorconfig.nvim",
    event = "VeryLazy",
  },
  {
    "ethanholz/nvim-lastplace",
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
    "rose-pine/neovim",
    name = "rose-pine",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      ensure_installed = "all",
      highlight = { enable = true },
    },
  },
  {
    "https://git.sr.ht/~nedia/auto-save.nvim",
    event = "BufWinEnter",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {
      columns = {},
      skip_confirm_for_simple_edits = true,
    },
  },
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>o",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
      },
      {
        "<leader>i",
        function()
          require("harpoon.mark").add_file()
        end,
      },
      {
        "<leader>a",
        function()
          require("harpoon.ui").nav_file(1)
        end,
      },
      {
        "<leader>s",
        function()
          require("harpoon.ui").nav_file(2)
        end,
      },
      {
        "<leader>d",
        function()
          require("harpoon.ui").nav_file(3)
        end,
      },
      {
        "<leader>f",
        function()
          require("harpoon.ui").nav_file(4)
        end,
      },
      {
        "<leader>g",
        function()
          require("harpoon.ui").nav_file(5)
        end,
      },
    },
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
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    config = function()
      local vim = vim
      local formatter = require("formatter")
      local prettierConfig = function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
          stdin = true,
        }
      end

      local formatterConfig = {
        c = {
          function()
            return {
              exe = "clang-format",
              args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
              stdin = true,
            }
          end,
        },
        cpp = {
          function()
            return {
              exe = "clang-format",
              args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
              stdin = true,
            }
          end,
        },
        sh = {
          function()
            return {
              exe = "shfmt",
              args = {},
              stdin = true,
            }
          end,
        },
        bash = {
          function()
            return {
              exe = "shfmt",
              args = {},
              stdin = true,
            }
          end,
        },
        zsh = {
          function()
            return {
              exe = "shfmt",
              args = {},
              stdin = true,
            }
          end,
        },
        lua = {
          function()
            return {
              exe = "stylua",
              args = { "-" },
              stdin = true,
            }
          end,
        },
        go = {
          function()
            return {
              exe = "gofmt",
              args = {},
              stdin = true,
            }
          end,
        },
        python = {
          function()
            return {
              exe = "python -m autopep8",
              args = { "--in-place --aggressive --aggressive", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
              stdin = false,
            }
          end,
        },
        vue = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote", "--parser", "vue" },
              stdin = true,
            }
          end,
        },
        rust = {
          function()
            return {
              exe = "rustfmt",
              args = { "--emit=stdout" },
              stdin = true,
            }
          end,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      }

      local commonFT = { "css", "scss", "html", "java", "javascript", "javascriptreact", "typescript", "typescriptreact", "markdown", "markdown.mdx", "json", "yaml", "xml", "svg", "svelte" }

      for _, ft in ipairs(commonFT) do
        formatterConfig[ft] = { prettierConfig }
      end

      formatter.setup({
        logging = true,
        filetype = formatterConfig,
      })
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
})

vim.cmd("colorscheme rose-pine-dawn")

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.completeopt = "menuone,noinsert,noselect"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statusline = "%F"
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪"
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim"
vim.opt.undolevels = 10000

vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hidden = true
vim.opt.history = 100
vim.opt.lazyredraw = true
vim.opt.updatetime = 100

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<leader>q", ":q<enter>")
vim.keymap.set("n", "Q", ":qa!<enter>")

vim.keymap.set("", "<Right>", "<C-w><")
vim.keymap.set("", "<Down>", "<C-w>-")
vim.keymap.set("", "<Up>", "<C-w>+")
vim.keymap.set("", "<Left>", "<C-w>>")

vim.keymap.set("n", "ss", "<C-w>s")
vim.keymap.set("n", "sv", "<C-w>v")

vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

vim.keymap.set("n", "gf", ":cd %:h<enter>:edit <cfile><enter>")
