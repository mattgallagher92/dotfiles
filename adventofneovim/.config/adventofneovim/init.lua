print 'advent of neovim'

require('config.lazy')

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
