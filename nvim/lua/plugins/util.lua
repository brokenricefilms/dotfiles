return {
	{ "folke/persistence.nvim", enabled = false },
	{
		"numToStr/Navigator.nvim",
		event = "VeryLazy",
		config = function()
			require("Navigator").setup()
			vim.keymap.set({ "n", "t" }, "<A-h>", "<CMD>NavigatorLeft<CR>")
			vim.keymap.set({ "n", "t" }, "<A-l>", "<CMD>NavigatorRight<CR>")
			vim.keymap.set({ "n", "t" }, "<A-k>", "<CMD>NavigatorUp<CR>")
			vim.keymap.set({ "n", "t" }, "<A-j>", "<CMD>NavigatorDown<CR>")
			vim.keymap.set({ "n", "t" }, "<A-p>", "<CMD>NavigatorPrevious<CR>")
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {},
			skip_confirm_for_simple_edits = true,
		},
	},
	{
		"gpanders/editorconfig.nvim",
		event = "VeryLazy",
	},
	--"tpope/vim-sleuth",
}
