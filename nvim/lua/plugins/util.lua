return {
	{
		"numToStr/Navigator.nvim",
		event = "VeryLazy",
		config = function()
			require("Navigator").setup({
				auto_save = "current",
			})
		end,
		keys = {
			{ "<A-h>", "<CMD>NavigatorLeft<CR>" },
			{ "<A-l>", "<CMD>NavigatorRight<CR>" },
			{ "<A-k>", "<CMD>NavigatorUp<CR>" },
			{ "<A-j>", "<CMD>NavigatorDown<CR>" },
		},
	},
}
