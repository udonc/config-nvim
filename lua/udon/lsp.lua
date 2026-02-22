vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = { current_line = true },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "危",
			[vim.diagnostic.severity.WARN] = "警",
			[vim.diagnostic.severity.INFO] = "報",
			[vim.diagnostic.severity.HINT] = "示",
		},
	},
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
	-- MDX
	"mdx_analyzer",
	-- JSON
	"jsonls",
	-- Biome (linter/formatter, biome.json(c) があるプロジェクトでのみ起動)
	"biome",
	-- TypeSpec
	"tsp_server",
})
