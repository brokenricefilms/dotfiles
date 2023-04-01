return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"astro-language-server",
				"bash-language-server",
				"clangd",
				"css-lsp",
				"cssmodules-language-server",
				"deno",
				"emmet-ls",
				"flake8",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"shfmt",
				"stylua",
				"svelte-language-server",
				"tailwindcss-language-server",
				"typescript-language-server",
				"vue-language-server",
				"write-good",
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			return {
				sources = {
					require("null-ls").builtins.formatting.shfmt,
					require("null-ls").builtins.formatting.stylua,

					require("null-ls").builtins.diagnostics.write_good,

					require("null-ls").builtins.hover.printenv,

					require("null-ls").builtins.code_actions.refactoring,
				},
			}
		end,
	},
}
