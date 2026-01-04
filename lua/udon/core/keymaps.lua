vim.g.mapleader = " "

-- editor split settings
vim.keymap.set("n", "<Leader>ss", ":vsplit<CR>")
vim.keymap.set("n", "<Leader>sc", ":close<CR>")
vim.keymap.set("n", "<Leader>so", ":only<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>")
