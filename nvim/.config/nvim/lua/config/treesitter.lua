vim.api.nvim_create_autocmd("FileType", {
  pattern = "fsharp",
  desc = "Enable Tree-sitter in fsharp files",
  group = vim.api.nvim_create_augroup("mattg-fsharp", { clear = true }),
  callback = function()
    vim.treesitter.start()
  end,
})
