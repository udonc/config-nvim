vim.g.mapleader = " "

-- editor split settings
vim.keymap.set("n", "<C-s>", ":vsplit<CR>")
vim.keymap.set("n", "<C-c>", ":close<CR>")
vim.keymap.set("n", "<C-o>", ":only<CR>")

vim.keymap.set("n", "<C-j>", "<C-w>w")
vim.keymap.set("n", "<C-k>", "<C-w>W")

vim.keymap.set("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>")

-- <C-Esc> でノーマルモードに切り替え
vim.keymap.set("i", "<C-Esc>", "<Esc>")
vim.keymap.set("v", "<C-Esc>", "<Esc>")
vim.keymap.set("c", "<C-Esc>", "<Esc>")
vim.keymap.set("t", "<C-Esc>", "<C-\\><C-n>")

-- スクロール時にカーソルを中央に維持
vim.keymap.set({ "n", "v", "x" }, "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set({ "n", "v", "x" }, "<C-d>", "<C-d>zz", { silent = true })
