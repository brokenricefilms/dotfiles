local filetype_configs = {
	cs = {
		function()
			return {
				exe = "clang-format",
				args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
				stdin = true,
				cwd = vim.fn.expand("%:p:h"),
			}
		end,
	},
	c = {
		function()
			return {
				exe = "clang-format",
				args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
				stdin = true,
				cwd = vim.fn.expand("%:p:h"),
			}
		end,
	},
	java = {
		function()
			return {
				exe = "clang-format",
				args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
				stdin = true,
				cwd = vim.fn.expand("%:p:h"),
			}
		end,
	},
	cpp = {
		function()
			return {
				exe = "clang-format",
				args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
				stdin = true,
				cwd = vim.fn.expand("%:p:h"),
			}
		end,
	},
	sh = {
		function()
			return {
				exe = "shfmt",
				args = { "-i", 2 },
				stdin = true,
			}
		end,
	},
	bash = {
		function()
			return {
				exe = "shfmt",
				args = { "-i", 2 },
				stdin = true,
			}
		end,
	},
	zsh = {
		function()
			return {
				exe = "shfmt",
				args = { "-i", 2 },
				stdin = true,
			}
		end,
	},
	lua = {
		function()
			return {
				exe = "stylua",
				args = {
					"--search-parent-directories",
					"-",
				},
				stdin = true,
			}
		end,
	},
	go = {
		function()
			return {
				exe = "gofmt",
				args = {},
				stdin = true,
			}
		end,
	},
	python = {
		function()
			return {
				exe = "python3 -m autopep8",
				args = {
					"--in-place --aggressive --aggressive",
					vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
				},
				stdin = false,
			}
		end,
	},
}

local prettier_config = {
	function()
		return {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
			},
			stdin = true,
		}
	end,
}

for _, ft in pairs({
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"svelte",
	"vue",
	"html",
	"css",
	"markdown",
	"json",
	"astro",
	"php",
	"yaml",
}) do
	filetype_configs[ft] = prettier_config
end

require("formatter").setup({
	logging = false,
	filetype = filetype_configs,
})

vim.cmd([[
augroup AutoFormatting
autocmd!
autocmd BufWritePost *.* FormatWrite | TrimWhitespace
augroup END
]])
