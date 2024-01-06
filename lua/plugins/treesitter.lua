return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	config = function()
		require("configs.treesitter")
	end,
}
