return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function(opts)
		require("lualine").setup(opts)
	end,
}
