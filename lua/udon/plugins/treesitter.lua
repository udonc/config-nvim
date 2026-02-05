return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 'markdown', 'markdown_inline' },
		highlight = { enable = true },
	},
}
