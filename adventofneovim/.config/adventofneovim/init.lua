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

-- LSP
vim.lsp.enable({ 'fsautocomplete' })
-- fsautocomplete returns invalid data, which Neovim doesn't handle well, causing the editor to lock up.
-- (See https://github.com/mattgallagher92/fsac-semantic-tokens-bug-repro). 
-- Workaround from https://github.com/neovim/neovim/issues/36257.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
vim.diagnostic.config({ virtual_text = true })
