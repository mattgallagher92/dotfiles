return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      layout_strategy = "bottom_pane",
      layout_config = {
        height = 0.9,
      },
    },
    pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,
  keys = {
    { "<leader>sf", "<cmd>Telescope find_files<CR>" },
    { "<leader>sh", "<cmd>Telescope help_tags<CR>" },
    { "<leader>sg", "<cmd>Telescope live_grep<CR>" },
    { "<leader>sb", "<cmd>Telescope buffers<CR>" },
  },
}
