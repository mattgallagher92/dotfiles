vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "StatusLine", "StatusLineNC", "EndOfBuffer" }
    local groups = { "Normal", "NormalNC" }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end
  end,
})

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    background = {
      light = "latte",
      dark = "frappe",
    },
  },
  init = function()
    vim.cmd.colorscheme("catppuccin-nvim")
  end,
}
