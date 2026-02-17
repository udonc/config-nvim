-- tree-sitter
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typespec", "gritql" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.filetype.add({
	extension = {
		grit = "gritql",
	},
})
