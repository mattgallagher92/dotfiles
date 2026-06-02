-- Inspired by https://www.youtube.com/watch?v=yI9R13h9IEE
return {
  -- Enables automatic installation of language serevers.
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    -- Defines configs for language servers.
    "neovim/nvim-lspconfig",
    {
      -- Enables installation of language servers from within Neovim.
      'mason-org/mason.nvim',
      config = true,
    },
    {
      -- Configures lua_ls with information about settings available in Neovim.
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  -- fsautocomplete managed separately
  opts = { ensure_installed = { 'lua_ls', 'tsgo', 'eslint', 'roslyn_ls' } },
}
