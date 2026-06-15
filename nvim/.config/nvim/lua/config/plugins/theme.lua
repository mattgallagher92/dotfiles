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
