vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    options = {
      -- Show errors for all lines, less severe diagnostics only for the cursor's line.
      multilines = {
        enabled = true,
        always_show = true,
        severity = { vim.diagnostic.severity.ERROR },
      },
    },
  },
}
