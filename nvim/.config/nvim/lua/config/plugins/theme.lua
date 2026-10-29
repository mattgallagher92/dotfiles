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
    custom_highlights = function(colors)
      return {
        -- Comments should be prominent. See https://www.youtube.com/watch?v=Ke3PYexY6XE.
        -- Good candidates (prominent, not too similar to other syntax highlights): rosewater, flamingo, sky, sapphire.
        -- Can test with code like the following.
        -- frappe = require("catppuccin.palettes").get_palette("frappe")
        -- vim.api.nvim_set_hl(0, "Comment", { fg = frappe.rosewater })
        Comment = { fg = colors.sapphire },
      }
    end,
  },
  init = function()
    vim.cmd.colorscheme("catppuccin-nvim")
  end,
}
