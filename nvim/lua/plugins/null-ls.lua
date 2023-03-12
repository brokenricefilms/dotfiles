return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.prettierd,
					nls.builtins.formatting.shfmt,
					nls.builtins.formatting.stylua,

					nls.builtins.diagnostics.eslint,
					nls.builtins.diagnostics.write_good,
					nls.builtins.diagnostics.shellcheck,
					nls.builtins.diagnostics.stylelint,
					nls.builtins.diagnostics.luacheck,

					nls.builtins.hover.printenv,

					nls.builtins.code_actions.refactoring,
				},
			}
		end,
	},
}
