return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			format = {
				cmdline = { title = " 指令 " },
				search_down = { title = " 索敵 " },
				search_up = { title = " 逆探 " },
				filter = { title = " 外殻 " },
				lua = { title = " 術式 " },
				help = { title = " 指南 " },
				calculator = { title = " 算術 " },
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{ filter = { error = true }, view = "notify", opts = { title = "異常" } },
			{ filter = { warning = true }, view = "notify", opts = { title = "警戒" } },
			{ filter = { event = "notify" }, view = "notify", opts = { title = "通達" } },
			{ filter = { event = "noice" }, view = "notify", opts = { title = "内部" } },
			{ filter = { event = "msg_show" }, view = "mini", opts = { title = "伝文" } },
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
