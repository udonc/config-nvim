return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			char = {
				enabled = false,
			},
		},
		search = {
			mode = function(pattern)
				if pattern == "" then
					return pattern
				end
				-- denops が running かつ kensaku が使えるなら変換
				local ok, status = pcall(vim.fn["denops#server#status"])
				if ok and status == "running" then
					local success, result = pcall(vim.fn["kensaku#query"], pattern)
					if success then
						return result
					end
				end
				-- fallback: exact match
				return "\\V" .. pattern:gsub("\\", "\\\\")
			end,
		},
	},
	keys = {
		{ "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	},
}
