return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
	},
	keys = {
		{
			"]c",
			function()
				require("gitsigns").nav_hunk("next")
			end,
			desc = "Next Hunk",
		},
		{
			"[c",
			function()
				require("gitsigns").nav_hunk("prev")
			end,
			desc = "Previous Hunk",
		},
		{
			"<leader>hs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "Stage Hunk",
		},
		{
			"<leader>hr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset Hunk",
		},
		{
			"<leader>hp",
			function()
				require("gitsigns").preview_hunk_inline()
			end,
			desc = "Preview Hunk Inline",
		},
		{
			"<leader>hb",
			function()
				require("gitsigns").blame_line()
			end,
			desc = "Blame Line",
		},
	},
}
