return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		{
			"nvimtools/none-ls.nvim",
			event = "VeryLazy",
		},
	},
	config = function()
		require("null-ls").setup(require("configs.null-ls").null_ls_setup())
		require("configs.null-ls").mason_null_ls_setup()
	end,
}
