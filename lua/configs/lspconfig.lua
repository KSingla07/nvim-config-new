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
		"rust_analyzer",
		"tailwindcss",
		"cssls",
		"html",
		"cucumber_language_server",
		"groovyls",
		"cssmodules_ls",
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
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		lsp_attach(client, bufnr)
	end,
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
lspconfig.groovyls.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	filetypes = { "groovy", "Jenkinsfile" },
})
lspconfig.html.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
lspconfig.cssls.setup({
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
-- lspconfig.clangd.setup({
-- 	on_attach = function(client, bufnr)
-- 		client.server_capabilities.signatureHelpProvider = false
-- 		lsp_attach(client, bufnr)
-- 	end,
-- 	capabilities = lsp_capabilities,
-- })
lspconfig.tsserver.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
lspconfig.tailwindcss.setup({
	on_attach = function(client, bufnr)
		require("tailwindcss-colors").buf_attach(bufnr)
		lsp_attach(client, bufnr)
	end,
	capabilities = lsp_capabilities,
})
lspconfig.cucumber_language_server.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
lspconfig.cssmodules_ls.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
