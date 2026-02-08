return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'echasnovski/mini.icons' },
	opts = function(_, opts)
		opts.sections = opts.sections or {}
		opts.sections.lualine_c = opts.sections.lualine_c or {}
		opts.sections.lualine_x = opts.sections.lualine_x or {}

		-- Claude connection status
		table.insert(opts.sections.lualine_c, {
			function()
				return " "
			end,
			color = function()
				local connected = require("claudecode").is_claude_connected()
				return connected and "Special" or "DiagnosticWarn"
			end,
			cond = function()
				local ok, cc = pcall(require, "claudecode")
				return ok and cc.is_claude_connected ~= nil
			end,
		})
	end,
	config = function(opts)
		require("lualine").setup(opts)
	end,
}
