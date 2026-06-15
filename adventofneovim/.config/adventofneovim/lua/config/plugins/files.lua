return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      skip_confirm_for_simple_edits = true,
      watch_for_changes = true,
      use_default_keymaps = true,
      keymaps = {
        ['gy'] = 'actions.yank_entry',
      },
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name)
          return vim.startswith(name, '.')
        end,
        is_always_hidden = function(name)
          return name == '..'
        end,
      },
    },
    keys = { { '<leader>-', vim.cmd.Oil, desc = 'Open parent directory in oil' } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  }
}
