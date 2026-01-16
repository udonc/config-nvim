vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.lsp.enable({
	-- nvim-lspconfig で"lua_ls"という名前で設定したプリセットが読まれる
	-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua
	"lua_ls",
	-- TypeScript/JavaScript
	"ts_ls",
	-- Markdown
	"marksman",
	-- JSON
	"jsonls",
})
