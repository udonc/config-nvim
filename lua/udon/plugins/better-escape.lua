return {
	"max397574/better-escape.nvim",
	event = { "InsertEnter", "TermOpen" },
	opts = {
		timeout = 200,
		default_mappings = false,
		mappings = {
			i = {
				j = {
					k = "<Esc>",
				},
			},
			t = {
				j = {
					k = "<C-\\><C-n>",
				},
			},
			v = {
				j = {
					k = "<Esc>",
				},
			},
		},
	},
}
