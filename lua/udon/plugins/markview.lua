return {
	"OXY2DEV/markview.nvim",
	ft = { "markdown", "mdx" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = function()
		-- "<C-u>" 等の特殊キーを内部キーコードに変換するヘルパー
		-- vim.cmd("normal!") に直接 Lua エスケープ(\x15 等)を渡すと動かないため、
		-- nvim_replace_termcodes で正しく変換してから nvim_feedkeys に渡す
		local function t(keys)
			return vim.api.nvim_replace_termcodes(keys, true, true, true)
		end

		-- splitview の preview ペインに zz を飛ばしてセンタリングを同期する
		-- 現在のウィンドウ以外の全ウィンドウに対して zz を実行する
		-- 呼び出し側で vim.schedule() 経由にすること（スクロール完了後に実行するため）
		local function sync_preview_zz()
			local cur_win = vim.api.nvim_get_current_win()
			for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
				if win ~= cur_win then
					vim.api.nvim_win_call(win, function()
						vim.cmd("normal! zz")
					end)
				end
			end
		end

		return {
			{ "<Leader>mm", "<cmd>Markview splitToggle<cr>", ft = { "markdown", "mdx" }, desc = "Toggle Markdown split preview" },
			-- zz / <C-u> / <C-d> で preview ペインのセンタリングも同期する
			{
				"zz",
				function()
					vim.cmd("normal! zz")
					vim.schedule(sync_preview_zz)
				end,
				ft = { "markdown", "mdx" },
				desc = "Center cursor and sync preview",
			},
			{
				"<C-u>",
				function()
					vim.api.nvim_feedkeys(t("<C-u>zz"), "n", false)
					vim.schedule(sync_preview_zz)
				end,
				ft = { "markdown", "mdx" },
				desc = "Half page up and sync preview",
			},
			{
				"<C-d>",
				function()
					vim.api.nvim_feedkeys(t("<C-d>zz"), "n", false)
					vim.schedule(sync_preview_zz)
				end,
				ft = { "markdown", "mdx" },
				desc = "Half page down and sync preview",
			},
		}
	end,
	opts = {
		preview = {
			-- バッファ内プレビューは無効化し、<Leader>mm の splitview で確認する運用
			enable = false,
			splitview_winopts = {
				split = "right",
			},
		},
	},
}
