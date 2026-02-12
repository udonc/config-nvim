return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	opts = {
		ensure_installed = {
			'markdown', 'markdown_inline',
			'typescript', 'tsx', 'javascript',
			'lua',
			'json', 'jsonc',
			'html', 'css',
			'fish',
		},
		highlight = { enable = true },
	},
}
