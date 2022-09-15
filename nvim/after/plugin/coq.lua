vim.g.coq_settings = {
	keymap = {
		recommended = false,
		jump_to_mark = "<c-e>",
		-- manual_complete = ";;",
	},
	clients = {
		buffers = {
			enabled = true,
			weight_adjust = -1.9,
		},
		tree_sitter = {
			enabled = true,
			weight_adjust = -1.5,
		},
		lsp = {
			enabled = true,
			weight_adjust = 1.5,
		},
		snippets = {
			enabled = true,
			weight_adjust = 1.9,
		},
		tabnine = { enabled = true },
	},
}
