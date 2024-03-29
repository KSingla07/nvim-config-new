local keymap = vim.api.nvim_set_keymap
local default_opts = {
	noremap = true,
	silent = true,
}
require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})
keymap("n", "<Tab>", ":bn<CR>", default_opts)
keymap("n", "<S-Tab>", ":bp<CR>", default_opts)
keymap("n", "<C-x>", ":Bdelete<CR>", default_opts)
keymap("n", "<Leader>x", ":Bdelete<CR>", default_opts)
