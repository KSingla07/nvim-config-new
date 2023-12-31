require("lsp-progress").setup({
	client_format = function(client_name, spinner, series_messages)
		if #series_messages == 0 then
			return nil
		end
		return {
			name = client_name,
			body = spinner .. " " .. table.concat(series_messages, ", "),
		}
	end,
	format = function(client_messages)
		--- @param name string
		--- @param msg string?
		--- @return string
		local function stringify(name, msg)
			return msg and string.format("%s %s", name, msg) or name
		end

		local sign = "" -- nf-fa-gear \uf013
		local lsp_clients = vim.lsp.get_active_clients()
		local messages_map = {}
		for _, climsg in ipairs(client_messages) do
			messages_map[climsg.name] = climsg.body
		end

		if #lsp_clients > 0 then
			table.sort(lsp_clients, function(a, b)
				return a.name < b.name
			end)
			local builder = {}
			for _, cli in ipairs(lsp_clients) do
				if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
					if messages_map[cli.name] then
						table.insert(builder, stringify(cli.name, messages_map[cli.name]))
					else
						table.insert(builder, stringify(cli.name))
					end
				end
			end
			if #builder > 0 then
				return sign .. " " .. table.concat(builder, ", ")
			end
		end
		return ""
	end,
})
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", require("lsp-progress").progress },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = "lualine_augroup",
	pattern = "LspProgressStatusUpdated",
	callback = require("lualine").refresh,
})
