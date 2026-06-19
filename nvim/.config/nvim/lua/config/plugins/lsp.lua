-- Inspired by https://www.youtube.com/watch?v=yI9R13h9IEE
return {
  {
    -- Enables automatic installation of any tool that can be managed by Mason.
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- fsautocomplete managed separately
    opts = { ensure_installed = { "lua_ls", "stylua", "tsgo", "eslint", "roslyn_ls" } },
    dependencies = {
      -- Enables automatic installation of language serevers. Using it means that we can use lspconfig names rather than mason names in ensure_installed.
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
        -- Defines configs for language servers.
        "neovim/nvim-lspconfig",
        {
          -- Enables installation of language servers from within Neovim.
          "mason-org/mason.nvim",
          opts = {},
        },
      },
    },
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
}
