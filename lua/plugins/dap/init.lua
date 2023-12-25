local dapconfig = require("configs.nvim-dap")
return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mason.nvim", "mfussenegger/nvim-dap" },
		cmd = { "DapInstall", "DapUninstall" },
		opts = dapconfig.mason_nvim_dap_opts,
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = {
			"mfussenegger/nvim-dap",
			"jay-babu/mason-nvim-dap.nvim",
		},
		ft = { "go", "gomod", "gotmpl", "gosum" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
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
				lazy = true,
				dependencies = {
					"mfussenegger/nvim-dap",
					"nvim-treesitter/nvim-treesitter",
				},
				opts = {
					commented = true,
				},
			},
			"jay-babu/mason-nvim-dap.nvim",
			{
				"nvim-telescope/telescope-dap.nvim",
				dependencies = {
					"mfussenegger/nvim-dap",
					"nvim-telescope/telescope.nvim",
					"nvim-treesitter/nvim-treesitter",
				},
				config = function()
					require("telescope").load_extension("dap")
				end,
			},
		},
		keys = dapconfig.nvim_dap_ui_keys,
		opts = {},
		config = dapconfig.nvim_dap_ui_setup,
	},
}
