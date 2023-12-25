local dapconfig = require("configs.nvim-dap")
return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		{
			"mfussenegger/nvim-dap",
			dependencies = {},
		},
		{
			"folke/neodev.nvim",
			opts = {
				library = {
					plugins = { "nvim-dap-ui", "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
					types = true,
				},
			},
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			dependencies = {
				"mfussenegger/nvim-dap",
				"nvim-treesitter/nvim-treesitter",
			},
			opts = {
				commented = true,
			},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = { "mason.nvim", "mfussenegger/nvim-dap" },
			cmd = { "DapInstall", "DapUninstall" },
			opts = dapconfig.mason_nvim_dap_opts,
		},
	},
	keys = dapconfig.nvim_dap_ui_keys,
	opts = {},
	config = dapconfig.nvim_dap_ui_setup,
}
