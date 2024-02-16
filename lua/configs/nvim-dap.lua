local M = {}
M.nvim_dap_ui_setup = function(_, opts)
	local dap = require("dap")
	local dapui = require("dapui")
	local widgets = require("dap.ui.widgets")
	dapui.setup(opts)
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({})
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close({})
	end
	vim.keymap.set("n", "<F5>", function()
		dap.continue()
	end)
	vim.keymap.set("n", "<F10>", function()
		dap.step_over()
	end)
	vim.keymap.set("n", "<F11>", function()
		dap.step_into()
	end)
	vim.keymap.set("n", "<F12>", function()
		dap.step_out()
	end)
	vim.keymap.set("n", "<Leader>b", function()
		dap.toggle_breakpoint()
	end)
	vim.keymap.set("n", "<Leader>B", function()
		dap.set_breakpoint()
	end)
	vim.keymap.set("n", "<Leader>lp", function()
		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end)
	vim.keymap.set("n", "<Leader>dr", function()
		dap.repl.open()
	end)
	vim.keymap.set("n", "<Leader>dl", function()
		dap.run_last()
	end)
	vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
		widgets.hover()
	end)
	vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
		widgets.preview()
	end)
	vim.keymap.set("n", "<Leader>df", function()
		widgets.centered_float(widgets.frames)
	end)
	vim.keymap.set("n", "<Leader>ds", function()
		widgets.centered_float(widgets.scopes)
	end)
end
M.nvim_dap_ui_keys = {
	{
		"<leader>du",
		function()
			require("dapui").toggle({})
		end,
		desc = "Dap UI",
	},
	{
		"<leader>de",
		function()
			require("dapui").eval()
		end,
		desc = "Eval",
		mode = { "n", "v" },
	},
}
M.mason_nvim_dap_opts = {
	automatic_installation = false,
	handlers = {},
	ensure_installed = {
		"delve",
		"codelldb",
	},
}
return M
