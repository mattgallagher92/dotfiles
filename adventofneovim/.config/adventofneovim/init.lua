print 'advent of neovim'

require('config.lazy')

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4

vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<space>x', ':.lua<CR>')
vim.keymap.set('v', '<space>x', ':lua<CR>')

vim.keymap.set('n', '<M-n>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<M-p>', '<cmd>cprev<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight after yanking text',
  group = vim.api.nvim_create_augroup('aon-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Tree-sitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fsharp',
  desc = 'Enable Tree-sitter in fsharp files',
  group = vim.api.nvim_create_augroup('aon-fsharp', { clear = true }),
  callback = function()
    vim.treesitter.start()
  end,
})

-- LSP
-- Other LSP configs enabled via Mason LSP config. I want fine-grained control over fsautocomplete.
vim.lsp.enable({ 'fsautocomplete' })
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('aon-lsp', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    -- fsautocomplete returns invalid data, which Neovim doesn't handle well, causing the editor to lock up.
    -- (See https://github.com/mattgallagher92/fsac-semantic-tokens-bug-repro).
    -- Workaround from https://github.com/neovim/neovim/issues/36257.
    if client and client.server_capabilities then
      client.server_capabilities.semanticTokensProvider = nil
    end

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if client and not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('aon-lsp', { clear = false }),
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
vim.diagnostic.config({ virtual_text = true })

-- Terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local job_id = 0
vim.keymap.set("n", "<space>to", function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 20)

  job_id = vim.bo.channel
end)

local current_command = ""
vim.keymap.set("n", "<space>te", function()
  current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<space>tr", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command, "" })
end)
