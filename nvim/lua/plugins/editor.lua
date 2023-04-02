return {
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>e", ":FzfLua files<enter>")
			vim.keymap.set("n", "<leader>E", ":FzfLua git_files<enter>")
			vim.keymap.set("n", "<leader>j", ":FzfLua live_grep<enter>")
		end,
	},
	{
		"windwp/nvim-spectre",
		keys = {
			{ "<leader>sr", false },
			{
				"<leader>r",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
}
