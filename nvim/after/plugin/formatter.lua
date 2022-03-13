-- configuration options for stylua
local filetype_configs = {
	cs = {
		-- clang-format
		function()
			return {
				exe = "clang-format",
				args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
				stdin = true,
				cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
			}
		end,
	},
	c = {
		-- clang-format
		function()
			return {
				exe = "clang-format",
				args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
				stdin = true,
				cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
			}
		end,
	},
	java = {
		-- clang-format
		function()
			return {
				exe = "clang-format",
				args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
				stdin = true,
				cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
			}
		end,
	},
	cpp = {
		-- clang-format
		function()
			return {
				exe = "clang-format",
				args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
				stdin = true,
				cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
			}
		end,
	},
	sh = {
		-- Shell Script Formatter
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
					-- '--config-path ~/dotfiles/stylua/stylua.toml',
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
				exe = "black",
				args = { "_" },
				stdin = true,
			}
		end,
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

-- configuration options for prettier
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

-- add a prettier_config for all js/ts/vue/svelte filetypes
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
}) do
	filetype_configs[ft] = prettier_config
end

-- require formatter.nvim
require("formatter").setup({
	logging = false,
	filetype = filetype_configs,
})

-- call formatter.nvim automatically on save
vim.cmd([[
augroup AutoFormatting
  au!
  au BufWritePost *.* FormatWrite
augroup END
]])
