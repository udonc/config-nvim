return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	opts = {
		mappings = { "<C-b>", "<C-f>", "zt", "zz", "zb" },
		easing = "quadratic",
	},
	config = function(_, opts)
		local neoscroll = require("neoscroll")
		neoscroll.setup(opts)

		local duration = 250

		local function scroll_and_center(scroll_func)
			return function()
				scroll_func({ duration = duration })
				vim.defer_fn(function()
					neoscroll.zz({ half_win_duration = 100 })
				end, duration + 10)
			end
		end

		vim.keymap.set({ "n", "v", "x" }, "<C-u>", scroll_and_center(neoscroll.ctrl_u), { silent = true })
		vim.keymap.set({ "n", "v", "x" }, "<C-d>", scroll_and_center(neoscroll.ctrl_d), { silent = true })
	end,
}
