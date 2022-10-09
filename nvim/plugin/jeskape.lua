require("jeskape").setup({
	mappings = {
		f = {
			p = "<cmd>call fzf#vim#complete#path('fd')<enter>",
			w = "<cmd>call fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})<enter>",
		},
		k = {
			k = "<esc>",
			j = "<esc>",
		},
		j = {
			j = "<esc>",
			k = "<esc>",
		},
		timeout = vim.o.timeoutlen,
	},
})
