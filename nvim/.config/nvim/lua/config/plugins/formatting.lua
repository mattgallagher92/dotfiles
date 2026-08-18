return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      fantomas = {
        -- Run fantomas as local dotnet tool.
        command = "dotnet",
        args = { "fantomas", "$FILENAME" },
      },
    },
    formatters_by_ft = {
      fsharp = { "fantomas" },
      lua = { "stylua" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    },
    -- Format after save to give slow formatters time, without locking the UI (which format on save would do).
    -- Not using lsp_format as a fallback, because it seemed to slow down performance even when a dedicated formatter
    -- was present, for some reason 🤷
    format_after_save = {},
  },
}
