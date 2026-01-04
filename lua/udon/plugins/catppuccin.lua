return { 
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	flavor = "macchiato",
	transparent_background = true,
	config = function()
		vim.cmd("colorscheme catppuccin")
	end
}

