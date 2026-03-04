return {
	"WilliamHsieh/overlook.nvim",
	opts = {
		on_stack_empty = function()
			vim.schedule(function()
				-- cursorline の値は true のまま変わってないが、style="minimal" のフロートを
				-- 閉じた後に Neovim の描画が壊れる。トグルで再描画を強制する。
				vim.wo.cursorline = false
				vim.wo.cursorline = true
			end)
		end,
		ui = {
			border = "rounded",
		},
		adapters = {
			implementation = require("udon.overlook-adapters.implementation"),
			declaration = require("udon.overlook-adapters.declaration"),
			references = require("udon.overlook-adapters.references"),
		},
	},
	keys = {
		{
			"<leader>pp",
			function()
				require("overlook.api").peek_definition()
			end,
			desc = "Peek definition",
		},
		{
			"<leader>pi",
			function()
				require("overlook.peek").implementation()
			end,
			desc = "Peek implementation",
		},
		{
			"<leader>pd",
			function()
				require("overlook.peek").declaration()
			end,
			desc = "Peek declaration",
		},
		{
			"<leader>pr",
			function()
				require("overlook.peek").references()
			end,
			desc = "Peek references",
		},
		{
			"<leader>pm",
			function()
				require("overlook.api").peek_mark()
			end,
			desc = "Peek mark",
		},
		{
			"<leader>pu",
			function()
				require("overlook.api").restore_popup()
			end,
			desc = "Restore last popup",
		},
		{
			"<leader>pU",
			function()
				require("overlook.api").restore_all_popups()
			end,
			desc = "Restore all popups",
		},
		{
			"<leader>pc",
			function()
				require("overlook.api").close_all()
				vim.schedule(function()
					vim.wo.cursorline = false
					vim.wo.cursorline = true
				end)
			end,
			desc = "Close all popups",
		},
		{
			"<leader>pf",
			function()
				require("overlook.api").switch_focus()
			end,
			desc = "Switch focus",
		},
	},
	config = function(_, opts)
		require("overlook").setup(opts)

		-- ポップアップウィンドウ内でのみ有効なキーマップ
		-- vim.w.is_overlook_popup でポップアップを判定
		vim.api.nvim_create_autocmd("WinEnter", {
			callback = function()
				vim.schedule(function()
					local buf = vim.api.nvim_get_current_buf()
					if vim.w.is_overlook_popup then
						vim.wo.cursorline = true
						vim.keymap.set("n", "<CR>", function()
							require("overlook.api").open_in_original_window()
						end, { buffer = buf, desc = "Overlook: Open in current window" })
						vim.keymap.set("n", "<C-CR>", function()
							require("overlook.api").open_in_vsplit()
						end, { buffer = buf, desc = "Overlook: Open in vsplit" })
					end
				end)
			end,
		})
	end,
}
