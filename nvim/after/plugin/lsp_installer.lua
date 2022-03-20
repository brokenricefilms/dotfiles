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

local function install_server(server)
	local lsp_installer_servers = require("nvim-lsp-installer.servers")
	local ok, server_analyzer = lsp_installer_servers.get_server(server)
	if ok then
		if not server_analyzer:is_installed() then
			-- server_analyzer:install(server) -- will install in background
			lsp_installer.install(server) -- install window will popup
		end
	end
end

local servers = {
	"bashls",
	"clangd",
	"csharp_ls",
	"cssls",
	"cssmodules_ls",
	"denols",
	"diagnosticls",
	"emmet_ls",
	"gopls",
	"html",
	"intelephense",
	"jdtls",
	"jsonls",
	"pyright",
	"sqlls",
	"sumneko_lua",
	"tsserver",
	"vimls",
	"vuels",
}

for _, server in ipairs(servers) do
	install_server(server)
end
