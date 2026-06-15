print 'advent of neovim'

-- Must be set before loading plugins so that key maps use correct leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shiftwidth = 4
vim.opt.undofile = true

vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

vim.keymap.set('n', '<M-n>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<M-p>', '<cmd>cprev<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight after yanking text',
  group = vim.api.nvim_create_augroup('aon-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require('config.lazy')
require('config.treesitter')
require('config.lsp')
require('config.terminal')
