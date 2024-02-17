local M = {}
M.null_ls_setup = function()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local opts = {
		sources = {
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.goimports_reviser,
			null_ls.builtins.formatting.golines,
			null_ls.builtins.code_actions.eslint_d,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.rustywind,
			null_ls.builtins.formatting.sql_formatter,
			null_ls.builtins.diagnostics.markuplint,
			null_ls.builtins.formatting.pg_format.with({
				extra_args = {
					"--keyword-case",
					"2",
					"--function-case",
					"2",
					"--type-case",
					"3",
					"--no-space-function",
				},
			}),
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.nginx_beautifier,
			null_ls.builtins.formatting.rustfmt,
			null_ls.builtins.formatting.npm_groovy_lint,
			null_ls.builtins.diagnostics.npm_groovy_lint,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({
					group = augroup,
					buffer = bufnr,
				})
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	}
	return opts
end
M.mason_null_ls_setup = function()
	require("mason-null-ls").setup({
		ensure_installed = {
			-- For Golang
			"gofumpt",
			"goimports-reviser",
			"golines",
			"gomodifytags",
			"gotests",
			"impl",
			"iferr",
			"gotestsum",

			-- Typescript
			"eslint-lsp",
			"prettierd",
			"eslint_d",
			"rustywind",
			"markuplint",

			-- SQL
			"sql-formatter",

			-- Lua
			"stylua",

			-- Nginx LSP
			"nginx-language-server",
			-- Rust
			"rustfmt",
		},
		automatic_installation = false,
	})
end
return M
