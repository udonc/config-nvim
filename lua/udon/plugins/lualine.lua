return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'echasnovski/mini.icons' },
	opts = function(_, opts)
		opts.sections = opts.sections or {}
		opts.sections.lualine_c = opts.sections.lualine_c or {}
		opts.sections.lualine_x = opts.sections.lualine_x or {}

		-- Copilot status
		table.insert(opts.sections.lualine_c, {
			function()
				return " "
			end,
			color = function()
				local status = require("sidekick.status").get()
				if status then
					return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
				end
			end,
			cond = function()
				local status = require("sidekick.status")
				return status.get() ~= nil
			end,
		})

		-- CLI session status
		table.insert(opts.sections.lualine_x, 2, {
			function()
				local status = require("sidekick.status").cli()
				return " " .. (#status > 1 and #status or "")
			end,
			cond = function()
				return #require("sidekick.status").cli() > 0
			end,
			color = function()
				return "Special"
			end,
		})
	end,
	config = function(opts)
		require("lualine").setup(opts)
	end,
}
