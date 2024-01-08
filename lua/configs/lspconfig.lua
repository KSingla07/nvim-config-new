require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"gopls",
		"dockerls",
		"bashls",
		"yamlls",
		"jsonls",
		"clangd",
		"tsserver",
	},
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_attach = function(client, bufnr)
	-- Create your keybindings here...
end
lspconfig.lua_ls.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
local util = require("lspconfig/util")
-- Gopls LSP settings
lspconfig.gopls.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			analyses = {
				unusedparams = true,
			},
			usePlaceholders = true,
		},
	},
})

lspconfig.yamlls.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
})
lspconfig.dockerls.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
lspconfig.bashls.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
lspconfig.nginx_language_server.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
lspconfig.jsonls.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
lspconfig.clangd.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
lspconfig.tsserver.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
lspconfig.postgres_lsp.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	filetypes = { "pgsql" },
	root_dir = util.root_pattern("*.pgsql"),
	single_file_support = true,
})
