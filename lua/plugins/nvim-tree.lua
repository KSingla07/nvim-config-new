return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		config = function()
			local devicons = require("nvim-web-devicons")
			devicons.setup({
				override = {
					pgsql = {
						icon = "",
						color = "#008bb9",
						cterm_color = "65",
						name = "postgres",
					},
					Jenkinsfile = {
						icon = "",
						color = "#008bb9",
						cterm_color = "65",
						name = "jenkinsfile",
					},
				},
			})
		end,
	},
	opts = {
		actions = {
			open_file = {
				window_picker = {
					enable = true,
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
		vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
		vim.keymap.set("n", "<leader>er", ":NvimTreeClose<CR>")
	end,
}
