return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Fancy icon support
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
