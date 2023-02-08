return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.eslint,
        },
      }
    end,
  },
}
