return {
	"vuki656/package-info.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	ft = "json",
	opts = {
		autostart = true,
		hide_up_to_date = false,
	},
	keys = {
		{ "<leader>ps", function() require("package-info").show() end, ft = "json", desc = "Show package versions" },
		{ "<leader>pt", function() require("package-info").toggle() end, ft = "json", desc = "Toggle package versions" },
		{ "<leader>pu", function() require("package-info").update() end, ft = "json", desc = "Update package" },
		{ "<leader>pd", function() require("package-info").delete() end, ft = "json", desc = "Delete package" },
		{ "<leader>pi", function() require("package-info").install() end, ft = "json", desc = "Install package" },
		{ "<leader>pv", function() require("package-info").change_version() end, ft = "json", desc = "Change package version" },
	},
}
