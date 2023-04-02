vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"ms-jpq/coq_nvim",
		config = function()
			vim.g.coq_settings = {
				keymap = {
					recommended = false,
					jump_to_mark = "<c-e>",
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
				},
			}
		end,
	},
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>e", ":FzfLua files<enter>")
			vim.keymap.set("n", "<leader>E", ":FzfLua git_files<enter>")
			vim.keymap.set("n", "<leader>j", ":FzfLua live_grep<enter>")
		end,
	},
	"tpope/vim-sleuth",
	{
		"gpanders/editorconfig.nvim",
		event = "VeryLazy",
	},
	{
		"ethanholz/nvim-lastplace",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
			lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
			lastplace_open_folds = true,
		},
	},
	{
		"romainl/vim-cool",
		event = "VeryLazy",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		opts = {
			highlight = { enable = true },
			indent = { enable = true, disable = { "python" } },
			ensure_installed = "all",
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["as"] = "@scope",
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<c-v>",
					},
					include_surrounding_whitespace = true,
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
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
				"<leader>a",
				function()
					require("harpoon.ui").nav_file(1)
				end,
			},
			{
				"<leader>s",
				function()
					require("harpoon.ui").nav_file(2)
				end,
			},
			{
				"<leader>d",
				function()
					require("harpoon.ui").nav_file(3)
				end,
			},
			{
				"<leader>f",
				function()
					require("harpoon.ui").nav_file(4)
				end,
			},
			{
				"<leader>g",
				function()
					require("harpoon.ui").nav_file(5)
				end,
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
	{
		"mhartington/formatter.nvim",
		event = "VeryLazy",
		config = function()
			local vim = vim
			local formatter = require("formatter")
			local prettierConfig = function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end

			local formatterConfig = {
				c = {
					function()
						return {
							exe = "clang-format",
							args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
							stdin = true,
						}
					end,
				},
				cpp = {
					function()
						return {
							exe = "clang-format",
							args = { "--assume-filename", vim.api.nvim_buf_get_name(0), "--style=Google" },
							stdin = true,
						}
					end,
				},
				sh = {
					function()
						return {
							exe = "shfmt",
							args = {},
							stdin = true,
						}
					end,
				},
				bash = {
					function()
						return {
							exe = "shfmt",
							args = {},
							stdin = true,
						}
					end,
				},
				zsh = {
					function()
						return {
							exe = "shfmt",
							args = {},
							stdin = true,
						}
					end,
				},
				lua = {
					function()
						return {
							exe = "stylua",
							args = { "-" },
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
							exe = "autopep8",
							args = {
								"--in-place --aggressive --aggressive",
								vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
							},
							stdin = false,
						}
					end,
				},
				vue = {
					function()
						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
								"--single-quote",
								"--parser",
								"vue",
							},
							stdin = true,
						}
					end,
				},
				rust = {
					function()
						return {
							exe = "rustfmt",
							args = { "--emit=stdout" },
							stdin = true,
						}
					end,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			}

			local commonFT = {
				"css",
				"scss",
				"html",
				"java",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"markdown",
				"markdown.mdx",
				"json",
				"yaml",
				"xml",
				"svg",
				"svelte",
			}

			for _, ft in ipairs(commonFT) do
				formatterConfig[ft] = { prettierConfig }
			end

			formatter.setup({
				logging = true,
				filetype = formatterConfig,
			})
		end,
	},
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
}, {
	performance = {
		rtp = {
			disabled_plugins = {
				"spellfile",
				"html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"health",
				"logipat",
				"matchit",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"rplugin",
				"rrhelper",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
			},
		},
	},
	install = { colorscheme = { "rose-pine-dawn", "shine" } },
})

vim.cmd("colorscheme rose-pine-dawn")

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.completeopt = "menuone,noinsert,noselect"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statusline = "%F"
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪"
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim"
vim.opt.undolevels = 10000

vim.opt.hidden = true
vim.opt.history = 100
vim.opt.lazyredraw = true
vim.opt.updatetime = 100

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<Right>", "<C-w><")
vim.keymap.set("n", "<Down>", "<C-w>-")
vim.keymap.set("n", "<Up>", "<C-w>+")
vim.keymap.set("n", "<Left>", "<C-w>>")

vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

vim.keymap.set("n", "gf", ":cd %:h<enter>:edit <cfile><enter>")

vim.keymap.set("n", "<leader><space>", "<C-^>")

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
		if ok and cl then
			vim.wo.cursorline = true
			vim.api.nvim_win_del_var(0, "auto-cursorline")
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		local cl = vim.wo.cursorline
		if cl then
			vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
			vim.wo.cursorline = false
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.cmd([[FormatWrite]])
	end,
})

vim.cmd("COQnow --shut-up")
