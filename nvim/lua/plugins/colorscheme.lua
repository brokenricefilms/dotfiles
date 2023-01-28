return {
  {
    "rose-pine/neovim",
    config = function()
      vim.o.background = "light"
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
