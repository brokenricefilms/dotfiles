return {
  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    event = "VeryLazy",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zenwritten",
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        tailwind = true,
        hsl_fn = true,
      },
    },
  },
}
