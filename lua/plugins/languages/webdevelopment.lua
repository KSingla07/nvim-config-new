return {
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		module = "tailwindcss-colors",
		config = function()
			require("tailwindcss-colors").setup()
		end,
	},
}
