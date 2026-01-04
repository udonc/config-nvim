-- tree-sitter
vim.api.nvim_create_autocmd("FileType", {
  pattern = "typespec",
  callback = function()
    vim.treesitter.start()
  end,
})
