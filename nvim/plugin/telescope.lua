local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
		preview = {
			mime_hook = function(filepath, bufnr, opts)
				local is_image = function(filepath)
					local image_extensions = { "png", "jpg" } -- Supported image formats
					local split_path = vim.split(filepath:lower(), ".", { plain = true })
					local extension = split_path[#split_path]
					return vim.tbl_contains(image_extensions, extension)
				end
				if is_image(filepath) then
					local term = vim.api.nvim_open_term(bufnr, {})
					local function send_output(_, data, _)
						for _, d in ipairs(data) do
							vim.api.nvim_chan_send(term, d .. "\r\n")
						end
					end
					vim.fn.jobstart({
						"catimg",
						filepath, -- Terminal image viewer command
					}, { on_stdout = send_output, stdout_buffered = true })
				else
					require("telescope.previewers.utils").set_preview_message(
						bufnr,
						opts.winid,
						"Binary cannot be previewed"
					)
				end
			end,
		},
		prompt_prefix = "❯ ",
		selection_caret = "❯ ",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>j", builtin.live_grep, {})
vim.keymap.set("n", "<leader>k", builtin.buffers, {})
vim.keymap.set("n", ";", builtin.commands, {})
vim.keymap.set("n", "<leader>;", builtin.command_history, {})
vim.api.nvim_set_keymap(
	"n",
	"<leader>h",
	"<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "gc", builtin.git_commits, {})
