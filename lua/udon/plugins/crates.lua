return {
	"saecki/crates.nvim",
	event = "BufRead Cargo.toml",
	opts = {
		completion = {
			crates = {
				enabled = true,
			},
		},
		lsp = {
			enabled = true,
			actions = true,
			completion = true,
			hover = true,
		},
	},
	keys = {
		{ "<leader>rct", function() require("crates").toggle() end, ft = "toml", desc = "Toggle crate info" },
		{ "<leader>rcr", function() require("crates").reload() end, ft = "toml", desc = "Reload crate info" },
		{ "<leader>rcv", function() require("crates").show_versions_popup() end, ft = "toml", desc = "Show versions" },
		{ "<leader>rcf", function() require("crates").show_features_popup() end, ft = "toml", desc = "Show features" },
		{ "<leader>rcd", function() require("crates").show_dependencies_popup() end, ft = "toml", desc = "Show dependencies" },
		{ "<leader>rcu", function() require("crates").update_crate() end, ft = "toml", desc = "Update crate" },
		{ "<leader>rcU", function() require("crates").upgrade_crate() end, ft = "toml", desc = "Upgrade crate" },
		{ "<leader>rca", function() require("crates").update_all_crates() end, ft = "toml", desc = "Update all crates" },
		{ "<leader>rcA", function() require("crates").upgrade_all_crates() end, ft = "toml", desc = "Upgrade all crates" },
		{ "<leader>rcH", function() require("crates").open_homepage() end, ft = "toml", desc = "Open homepage" },
		{ "<leader>rcR", function() require("crates").open_repository() end, ft = "toml", desc = "Open repository" },
	},
}
