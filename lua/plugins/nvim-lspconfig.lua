return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = {
				"williamboman/mason.nvim",
			},
		},
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
		"windwp/nvim-autopairs",
	},
	config = function()
		require("configs.lspconfig")
	end,
}
