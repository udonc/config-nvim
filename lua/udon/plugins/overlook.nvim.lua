return {
	"WilliamHsieh/overlook.nvim",
	opts = {
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
