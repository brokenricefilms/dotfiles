local keymap = vim.keymap.set
local saga = require("lspsaga")

saga.init_lsp_saga()

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

-- deno?
-- require("lspconfig")["tsserver"].setup({
-- on_attach = on_attach,
-- flags = lsp_flags,
-- })

require("lspconfig")["rust_analyzer"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {},
	},
})

require("lspconfig")["bashls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	filetypes = { "sh", "zsh", "bash" },
})

require("lspconfig")["clangd"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

require("lspconfig")["denols"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup({
	capabilities = capabilities,
	filetypes = { "html", "php" },
})

require("lspconfig").cssls.setup({
	filetypes = { "html", "php", "css", "scss", "less" },
})

require("lspconfig").cssmodules_ls.setup({})

require("lspconfig")["gopls"].setup({})

require("lspconfig").cmake.setup({})

require("lspconfig").dockerls.setup({})

require("lspconfig").eslint.setup({})

require("lspconfig").diagnosticls.setup({})

require("lspconfig").emmet_ls.setup({
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
})

require("lspconfig").csharp_ls.setup({})

require("lspconfig").sqls.setup({})

require("lspconfig").vimls.setup({})

require("lspconfig").phan.setup({})

require("lspconfig").sumneko_lua.setup({})

require("lspconfig").vuels.setup({})

require("lint").linters_by_ft = {
	markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
