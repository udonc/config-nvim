return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		require("nvim-treesitter.parsers").get_parser_configs().gritql = {
			install_info = {
				url = "https://github.com/getgrit/tree-sitter-gritql",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "main",
			},
			filetype = "gritql",
		}
	end,
	opts = {
		ensure_installed = {
			"markdown",
			"markdown_inline",
			"typescript",
			"tsx",
			"javascript",
			"lua",
			"json",
			"jsonc",
			"html",
			"css",
			"fish",
		},
		highlight = { enable = true },
	},
}
