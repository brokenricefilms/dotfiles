return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = { settings = { css = { lint = { unknownAtRules = "ignore" } } } },
        cssmodules_ls = {},
        tailwindcss = {},
        svelte = {},
        vuels = {},
        yamlls = {},
        astro = {},
        emmet_ls = {},
        clangd = {},
        bashls = {},
        cmake = {},
        unocss = {},
        diagnosticls = {},
        rust_analyzer = {},
        sqlls = {},
        gopls = {},
        dockerls = {},
        tsserver = {},
        lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } },
        awk_ls = {},
        ansiblels = {},
        eslint = {},
        phpactor = {},
        jsonls = {},
        marksman = {},
        nxls = {},
        pyright = {},
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,

          nls.builtins.formatting.stylua,

          nls.builtins.formatting.shfmt,

          nls.builtins.diagnostics.flake8,

          nls.builtins.formatting.rustfmt,
        },
      }
    end,
  },
}
