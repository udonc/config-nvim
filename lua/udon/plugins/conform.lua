return {
	'stevearc/conform.nvim',
	opts = function()
		return {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
			},
			formatters = {
				biome = {
					cwd = require("conform.util").root_file({ "biome.json", "biome.jsonc" }),
					require_cwd = true,
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		}
	end,
}
