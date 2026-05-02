print 'advent of neovim'

require('config.lazy')

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4

vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<space>x', ':.lua<CR>')
vim.keymap.set('v', '<space>x', ':lua<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight after yanking text',
  group = vim.api.nvim_create_augroup('aon-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Tree-sitter
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.fs' },
  desc = 'Enable Tree-sitter in fsharp files',
  group = vim.api.nvim_create_augroup('aon-fsharp', { clear = true }),
  callback = function()
    vim.treesitter.start()
  end,
})
