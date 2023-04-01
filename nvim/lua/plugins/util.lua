return {
	{
		"numToStr/Navigator.nvim",
		lazy = true,
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
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {},
			skip_confirm_for_simple_edits = true,
		},
	},
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>o",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
			},
			{
				"<leader>i",
				function()
					require("harpoon.mark").add_file()
				end,
			},
			{
				"<leader>1",
				function()
					require("harpoon.ui").nav_file(1)
				end,
			},
			{
				"<leader>2",
				function()
					require("harpoon.ui").nav_file(2)
				end,
			},
			{
				"<leader>3",
				function()
					require("harpoon.ui").nav_file(3)
				end,
			},
			{
				"<leader>4",
				function()
					require("harpoon.ui").nav_file(4)
				end,
			},
			{
				"<leader>5",
				function()
					require("harpoon.ui").nav_file(5)
				end,
			},
			{
				"<leader>6",
				function()
					require("harpoon.ui").nav_file(6)
				end,
			},
			{
				"<leader>7",
				function()
					require("harpoon.ui").nav_file(7)
				end,
			},
			{
				"<leader>8",
				function()
					require("harpoon.ui").nav_file(8)
				end,
			},
			{
				"<leader>9",
				function()
					require("harpoon.ui").nav_file(9)
				end,
			},
			{
				"<leader>0",
				function()
					require("harpoon.ui").nav_file(10)
				end,
			},
		},
	},
}
