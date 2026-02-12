return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = {
			preset = {
				header = table.concat({
					[[                                                                       ]],
					[[                                                                     ]],
					[[       ████ ██████           █████      ██                     ]],
					[[      ███████████             █████                             ]],
					[[      █████████ ███████████████████ ███   ███████████   ]],
					[[     █████████  ███    █████████████ █████ ██████████████   ]],
					[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					[[                        󱍿 新世代型電子式書斎󱍿                          ]],
				}, "\n"),
				keys = {},
			},
			sections = {
				{ section = "header", padding = 1 },
				{
					text = {
						{ "◢", hl = "SnacksDashboardKey" },
						{
							"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
							hl = "SnacksDashboardSpecial",
						},
						{ "◆", hl = "SnacksDashboardKey" },
						{
							"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
							hl = "SnacksDashboardSpecial",
						},
						{ "◣", hl = "SnacksDashboardKey" },
					},
					align = "center",
				},
				function()
					local stats = require("lazy.stats").stats()
					local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
					local v = vim.version()
					return {
						align = "center",
						padding = 0,
						text = {
							{ "◆ ", hl = "SnacksDashboardSpecial" },
							{ os.date("%Y-%m-%d"), hl = "SnacksDashboardTitle" },
							{ " ┆ ", hl = "SnacksDashboardSpecial" },
							{ "v" .. v.major .. "." .. v.minor .. "." .. v.patch, hl = "SnacksDashboardTitle" },
							{ " ┆ ", hl = "SnacksDashboardSpecial" },
							{ stats.loaded .. "/" .. stats.count .. "拡張", hl = "SnacksDashboardTitle" },
							{ " ┆ ", hl = "SnacksDashboardSpecial" },
							{ ms .. "ms", hl = "SnacksDashboardTitle" },
							{ " ◆", hl = "SnacksDashboardSpecial" },
						},
					}
				end,
				{
					text = {
						{ "┣", hl = "SnacksDashboardKey" },
						{
							"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
							hl = "SnacksDashboardSpecial",
						},
						{ "◆", hl = "SnacksDashboardKey" },
						{
							"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
							hl = "SnacksDashboardSpecial",
						},
						{ "┫", hl = "SnacksDashboardKey" },
					},
					align = "center",
				},
				function()
					local menu = {
						{
							icon = "文",
							desc = "文献探索",
							key = "f",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = "新", desc = "新規起草", key = "n", action = ":ene | startinsert" },
						{
							icon = "検",
							desc = "全文検索",
							key = "g",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = "近",
							desc = "近着文献",
							key = "r",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = "調",
							desc = "環境調整",
							key = "c",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{ icon = "復", desc = "前回復帰", key = "s", section = "session" },
						{
							icon = "拡",
							desc = "拡張管理",
							key = "L",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = "退", desc = "退室", key = "q", action = ":qa" },
					}
					local items = {}
					for _, m in ipairs(menu) do
						if m.enabled == nil or m.enabled then
							table.insert(items, {
								text = {
									{ m.icon, hl = "SnacksDashboardIcon", width = 6 },
									{ m.desc, hl = "SnacksDashboardDesc", width = 12 },
									{ m.key, hl = "SnacksDashboardKey" },
								},
								action = m.action,
								section = m.section,
								key = m.key,
								align = "center",
								padding = 1,
							})
						end
					end
					return items
				end,
				{
					text = {
						{ "◥", hl = "SnacksDashboardKey" },
						{
							"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
							hl = "SnacksDashboardSpecial",
						},
						{ "◆", hl = "SnacksDashboardKey" },
						{
							"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
							hl = "SnacksDashboardSpecial",
						},
						{ "◤", hl = "SnacksDashboardKey" },
					},
					align = "center",
					padding = 1,
				},
			},
		},
		image = {
			enabled = true,
			doc = {
				-- インライン表示は無効、K で Snacks.image.hover() を使ってポップアップ表示する
				inline = false,
				float = false,
			},
		},
		indent = {
			animate = { enabled = false },
		},
		lazygit = {
			win = {
				width = 0,
				height = 0,
			},
		},
		terminal = {
			win = {
				style = {
					position = "float",
					border = true,
				},
			},
		},
		picker = {
			hidden = true, -- dotfilesを表示
			ignored = false, -- gitignoreされたファイルは非表示（node_modules自動除外）
			include = {
				"_udonc", -- gitignoreされてても表示したいもの
			},
			sources = {
				smart = { title = "智探" },
				files = { title = "文献" },
				explorer = {
					title = "書庫",
					auto_close = true,
					replace_netrw = true,
				},
				grep = { title = "捜索" },
				buffers = { title = "帳面" },
				recent = { title = "履歴" },
				diagnostics = { title = "診断" },
				command_history = { title = "指令録" },
				grep_word = { title = "語句捜索" },
			},
		},
	},
	keys = {
		-- Top Pickers & Explorer
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		-- gh
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues (open)",
		},
		{
			"<leader>gI",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "GitHub Issues (all)",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub Pull Requests (open)",
		},
		{
			"<leader>gP",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "GitHub Pull Requests (all)",
		},
		-- Grep
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Search for Plugin Spec",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>sR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"gai",
			function()
				Snacks.picker.lsp_incoming_calls()
			end,
			desc = "C[a]lls Incoming",
		},
		{
			"gao",
			function()
				Snacks.picker.lsp_outgoing_calls()
			end,
			desc = "C[a]lls Outgoing",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
		-- Image
		{
			"K",
			function()
				Snacks.image.hover()
			end,
			ft = { "markdown", "mdx" },
			desc = "Show image popup",
		},
		-- Other
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Toggle Zoom",
		},
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
	},
}
