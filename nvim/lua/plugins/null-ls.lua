return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return {
        sources = {
          require("null-ls").builtins.formatting.prettierd,

          require("null-ls").builtins.diagnostics.eslint,
          require("null-ls").builtins.diagnostics.write_good,
          require("null-ls").builtins.diagnostics.shellcheck,
          require("null-ls").builtins.diagnostics.stylelint,
          require("null-ls").builtins.diagnostics.luacheck,
          require("null-ls").builtins.diagnostics.proselint,

          require("null-ls").builtins.hover.printenv,
          require("null-ls").builtins.hover.dictionary,

          require("null-ls").builtins.code_actions.refactoring,
          require("null-ls").builtins.code_actions.shellcheck,
          require("null-ls").builtins.code_actions.proselint,
        },
      }
    end,
  },
}
