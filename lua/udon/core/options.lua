vim.cmd("let g:netrw_liststyle = 3") -- netrw のリストスタイル

local opt = vim.opt

-- 行番号
opt.relativenumber = true -- 相対行番号表示
opt.number = true -- 行番号表示

-- Tab & インデント
opt.autoindent = true -- 自動インデント
opt.tabstop = 4 -- タブ幅
opt.shiftwidth = 4 -- 自動インデント幅

-- 不可視文字の可視化
opt.list = true
opt.listchars = { tab = " ▸", trail = "·" }

opt.wrap = false -- 行の折り返し

-- 検索
opt.ignorecase = true -- case-sensitive にしない
opt.smartcase = true -- 大文字と小文字が混在した文字列を検索した場合に case-sensitive にする

opt.cursorline = true -- カーソル行のライン表示

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- システムの clipboard を使用する：

-- terminal
opt.shell = "fish"

-- sprit 設定
opt.splitright = true
opt.splitbelow = true
opt.equalalways = true
