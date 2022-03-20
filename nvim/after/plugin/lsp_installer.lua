local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = {}

	if server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		}
	end

	server:setup(opts)
end)
