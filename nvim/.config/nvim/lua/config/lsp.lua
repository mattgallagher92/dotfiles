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
  end,
})
