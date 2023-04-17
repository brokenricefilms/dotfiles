return {
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
    "numToStr/Navigator.nvim",
    event = "VeryLazy",
    config = function()
      require("Navigator").setup({
        auto_save = "current",
      })
    end,
    keys = {
      { "<A-h>", "<CMD>NavigatorLeft<CR>" },
      { "<A-l>", "<CMD>NavigatorRight<CR>" },
      { "<A-k>", "<CMD>NavigatorUp<CR>" },
      { "<A-j>", "<CMD>NavigatorDown<CR>" },
    },
  },
}
