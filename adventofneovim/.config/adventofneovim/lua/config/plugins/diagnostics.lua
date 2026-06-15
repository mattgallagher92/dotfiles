local d = vim.diagnostic

local function jumper(opts)
  return function()
    d.jump(opts)
  end
end

vim.keymap.set("n", "<leader>dnd", jumper({ count = 1 }), { desc = "[D]iagnostics [n]ext [d]iagnostic" })
vim.keymap.set("n", "<leader>dpd", jumper({ count = -1 }), { desc = "[D]iagnostics [p]revious [d]iagnostic" })
vim.keymap.set("n", "<leader>dne", jumper({ count = 1, severity = d.severity.ERROR }),
  { desc = "[D]iagnostics [n]ext [e]rror" })
vim.keymap.set("n", "<leader>dpe", jumper({ count = -1, severity = d.severity.ERROR }),
  { desc = "[D]iagnostics [p]revious [e]rror" })
vim.keymap.set("n", "<leader>dnw", jumper({ count = 1, severity = d.severity.WARN }),
  { desc = "[D]iagnostics [n]ext [w]arning" })
vim.keymap.set("n", "<leader>dpw", jumper({ count = -1, severity = d.severity.WARN }),
  { desc = "[D]iagnostics [p]revious [w]arning" })

-- Disable Neovim's default virtual text diagnostics in favour of tiny-inline-diagnostic
d.config({ virtual_text = false })

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
