return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		event = "VeryLazy",
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine-dawn",
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				css = true,
				enable_tailwind = true,
				mode = "virtualtext",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		opts = {
			defaults = {
				results_title = false,

				sorting_strategy = "ascending",
				layout_strategy = "center",
				layout_config = {
					preview_cutoff = 1, -- Preview should always show (unless previewer = false)

					width = function(_, max_columns, _)
						return math.min(max_columns, 80)
					end,

					height = function(_, _, max_lines)
						return math.min(max_lines, 15)
					end,
				},

				border = true,
				borderchars = {
					prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
					results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			},
		},
	},
}
