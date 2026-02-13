return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		options = {
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{
					function()
						local mode_map = {
							["n"] = "待機",
							["no"] = "待機",
							["nov"] = "待機",
							["noV"] = "待機",
							["no\22"] = "待機",
							["niI"] = "待機",
							["niR"] = "待機",
							["niV"] = "待機",
							["nt"] = "待機",
							["ntT"] = "待機",
							["i"] = "刻印",
							["ic"] = "刻印",
							["ix"] = "刻印",
							["v"] = "走査",
							["vs"] = "走査",
							["V"] = "掃射",
							["Vs"] = "掃射",
							["\22"] = "矩陣",
							["\22s"] = "矩陣",
							["s"] = "捕捉",
							["S"] = "捕捉",
							["\19"] = "捕捉",
							["R"] = "書換",
							["Rc"] = "書換",
							["Rx"] = "書換",
							["Rv"] = "書換",
							["Rvc"] = "書換",
							["Rvx"] = "書換",
							["c"] = "指令",
							["cv"] = "指令",
							["ce"] = "指令",
							["t"] = "端末",
							["r"] = "確認",
							["rm"] = "確認",
							["r?"] = "確認",
							["!"] = "実行",
						}
						return mode_map[vim.api.nvim_get_mode().mode] or "？"
					end,
				},
			},
			lualine_b = {
				{ "branch", icon = "枝:" },
				{ "diff", symbols = { added = "増:", modified = "改:", removed = "削:" } },
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					symbols = { error = "危:", warn = "警:", info = "報:", hint = "示:" },
				},
			},
			lualine_c = {
				{
					"filename",
					path = 1,
					symbols = { modified = "", readonly = "鍵", unnamed = "名無ノ権兵衛" },
				},
				{
					function()
						return vim.bo.modified and "穢" or ""
					end,
					color = "DiagnosticWarn",
				},
			},
			lualine_x = {
				{
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						local names = {}
						for _, client in ipairs(clients) do
							table.insert(names, client.name)
						end
						return table.concat(names, ", ")
					end,
					icon = " ",
					cond = function()
						return #vim.lsp.get_clients({ bufnr = 0 }) > 0
					end,
				},
				{ "filetype", icon_only = false },
			},
			lualine_y = {
				{
					function()
						local mode = vim.fn.mode()
						if not mode:find("[vV\22]") then
							return ""
						end

						local start_pos = vim.fn.getpos("v")
						local end_pos = vim.fn.getpos(".")
						local start_line, start_col = start_pos[2], start_pos[3]
						local end_line, end_col = end_pos[2], end_pos[3]

						if start_line > end_line or (start_line == end_line and start_col > end_col) then
							start_line, end_line = end_line, start_line
							start_col, end_col = end_col, start_col
						end

						local lines = end_line - start_line + 1
						local chars = 0

						if mode == "V" then
							for i = start_line, end_line do
								chars = chars + vim.fn.strchars(vim.fn.getline(i))
							end
						elseif mode == "v" then
							if lines == 1 then
								local line = vim.fn.getline(start_line)
								chars = vim.fn.strchars(line:sub(start_col, end_col))
							else
								for i = start_line, end_line do
									local line = vim.fn.getline(i)
									if i == start_line then
										chars = chars + vim.fn.strchars(line:sub(start_col))
									elseif i == end_line then
										chars = chars + vim.fn.strchars(line:sub(1, end_col))
									else
										chars = chars + vim.fn.strchars(line)
									end
								end
							end
						else -- visual block (\22)
							for i = start_line, end_line do
								local line = vim.fn.getline(i)
								chars = chars + vim.fn.strchars(line:sub(start_col, end_col))
							end
						end

						if lines > 1 then
							return lines .. " 行 " .. chars .. " 文字"
						end
						return chars .. " chars"
					end,
				},
				{
					function()
						local cur = vim.fn.line(".")
						local total = vim.fn.line("$")
						if cur == 1 then
							return "頂"
						elseif cur == total then
							return "麓"
						else
							return string.format("%2d%%%%", math.floor(cur / total * 100))
						end
					end,
				},
			},
			lualine_z = { "location" },
		},
	},
	config = function(_, opts)
		-- claude connection status (right side)
		table.insert(opts.sections.lualine_x, 1, {
			function()
				local server_status = require("claudecode.server.init").get_status()
				if not server_status.running then
					return "蔵人符術:死"
				end
				local connected = require("claudecode").is_claude_connected()
				return connected and "蔵人符術:活" or "蔵人符術:眠"
			end,
			color = function()
				local server_status = require("claudecode.server.init").get_status()
				if not server_status.running then
					return "DiagnosticError"
				end
				local connected = require("claudecode").is_claude_connected()
				return connected and "special" or "comment"
			end,
			cond = function()
				local ok, cc = pcall(require, "claudecode")
				return ok and cc.is_claude_connected ~= nil
			end,
		})
		require("lualine").setup(opts)
	end,
}
