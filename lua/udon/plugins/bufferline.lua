return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "echasnovski/mini.icons",
	event = "VeryLazy",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			show_buffer_close_icons = false,
			offsets = {
				{
					filetype = "snacks_layout_box",
					text = "",
					highlight = "Directory",
				},
			},
		},
	},
}
