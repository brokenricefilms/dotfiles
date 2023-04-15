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
				astro = {},
				denols = {},
				emmet_ls = {},
				clangd = {},
				bashls = {},
				rust_analyzer = {},
				gopls = {},
			},
		},
	},
}
