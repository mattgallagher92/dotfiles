return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      fsharp = { "fantomas" },
      lua = { "stylua" },
    },
    format_on_save = {
      -- Long, but 500ms doesn't seem to be long enough for fantomas.
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  },
}
