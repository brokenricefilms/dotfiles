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
          nls.builtins.diagnostics.write_good,
          nls.builtins.diagnostics.shellcheck,

          nls.builtins.hover.printenv,
        },
      }
    end,
  },
}
