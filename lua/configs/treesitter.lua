vim.treesitter.language.register("sql", "pgsql")
vim.treesitter.language.register("groovy", "Jenkinsfile")
vim.cmd("au BufRead,BufNewFile *.pgsql set filetype=pgsql")
vim.cmd("au BufRead,BufNewFile *Jenkinsfile set filetype=Jenkinsfile")
vim.cmd("au BufRead,BufNewFile *jenkinsfile set filetype=Jenkinsfile")
require("nvim-treesitter.configs").setup({
	build = ":TSUpdate",
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"go",
		"gomod",
		"gosum",
		"gowork",
		"html",
		"css",
		"javascript",
		"typescript",
		"python",
		"tsx",
		"json",
		"yaml",
		"xml",
		"sql",
		"bash",
		"cpp",
		"csv",
		"java",
		"make",
		"kotlin",
		"python",
		"dockerfile",
		"cpp",
		"toml",
		"rust",
		"groovy",
	},
	auto_install = false,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Leader>ss",
			node_incremental = "<Leader>si",
			scope_incremental = "<Leader>sc",
			node_decremental = "<Leader>sd",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = true,
		},
	},
	sync_install = false,
	ignore_install = {},
	modules = {},
})
