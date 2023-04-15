return {
	{
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
		config = function()
			require("luasnip.loaders.from_snipmate").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
