return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {
		terminal = {
			split_side = "right",
			split_width_percentage = 0.50,
			provider = "snacks",
		},
	},
	keys = {
		-- ターミナルトグル（旧 <C-.> / <leader>aa / <leader>ac）
		{
			"<c-.>",
			"<cmd>ClaudeCode<cr>",
			desc = "Claude Code Toggle",
			mode = { "n", "t", "i", "x" },
		},
		{
			"<leader>aa",
			"<cmd>ClaudeCode<cr>",
			desc = "Claude Code Toggle",
		},
		-- フォーカス（旧 <leader>ac）
		{
			"<leader>ac",
			"<cmd>ClaudeCodeFocus<cr>",
			desc = "Claude Code Focus",
		},
		-- セッション閉じる（旧 <leader>ad）
		{
			"<leader>ad",
			"<cmd>ClaudeCodeClose<cr>",
			desc = "Claude Code Close",
		},
		-- 選択/コンテキスト送信（旧 <leader>at / <leader>av）
		{
			"<leader>at",
			"<cmd>ClaudeCodeSend<cr>",
			mode = { "x", "n" },
			desc = "Send to Claude",
		},
		{
			"<leader>av",
			"<cmd>ClaudeCodeSend<cr>",
			mode = { "x" },
			desc = "Send Visual Selection to Claude",
		},
		-- ファイル追加（旧 <leader>af）
		{
			"<leader>af",
			"<cmd>ClaudeCodeAdd %<cr>",
			desc = "Add Current File to Claude",
		},
		-- モデル選択（旧 <leader>as の代替）
		{
			"<leader>as",
			"<cmd>ClaudeCodeSelectModel<cr>",
			desc = "Select Claude Model",
		},
	},
}
