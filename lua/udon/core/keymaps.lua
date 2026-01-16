vim.g.mapleader = " "

-- editor split settings
vim.keymap.set("n", "<C-s>", ":vsplit<CR>")
vim.keymap.set("n", "<C-c>", ":close<CR>")
vim.keymap.set("n", "<C-o>", ":only<CR>")

vim.keymap.set("n", "<C-j>", "<C-w>w")
vim.keymap.set("n", "<C-k>", "<C-w>W")

vim.keymap.set("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>")

vim.keymap.set("t", "<C-u>", "<C-\\><C-N>k", {}) -- Scroll up using Ctrl + U
vim.keymap.set("t", "<C-d>", "<C-\\><C-N>j", {}) -- Scroll down using Ctrl + D
